import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/resources/firestore_methods.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../utils/colors.dart';
import '../widgets/comment_card.dart';

class CommentScreen extends StatefulWidget {
  final String snap;
  const CommentScreen({super.key, required this.snap});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();

  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .doc(widget.snap)
              .collection('comments')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return CommentCard(
                    commentSnap: snapshot.data!.docs[index],
                  );
                });
          }),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: kToolbarHeight,
        margin: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoUrl),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8),
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                      hintText: 'Comment as ${user.username}',
                      border: InputBorder.none),
                ),
              ),
            ),
            InkWell(
                onTap: () async {
                  await FirestoreMethods().postComment(
                      postId: widget.snap,
                      text: _commentController.text.toString(),
                      uid: user.uid,
                      name: user.username,
                      profilePic: user.photoUrl);
                  setState(() {
                    _commentController.text = '';
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: const Text(
                    'Post',
                    style: TextStyle(color: blueColor),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
