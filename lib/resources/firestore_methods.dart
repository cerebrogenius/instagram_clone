import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

import '../models/posts.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String description, Uint8List file, String uid,
      String username, String profImage) async {
    String res = "error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = Uuid().v1();

      Post post = Post(
          description: description,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profImage,
          likes: []);
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> LikePost(String postId, String uid, List likes)async {
    try {
      if (likes.contains(uid)) {
       await _firestore.collection('posts').doc(postId).update({'likes': FieldValue.arrayRemove([uid])});
      }
      else{
       await _firestore.collection('posts').doc(postId).update({'likes': FieldValue.arrayUnion([uid])});
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
