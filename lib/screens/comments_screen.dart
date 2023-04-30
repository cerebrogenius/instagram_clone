import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/comment_card.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
      ),
      body: const CommentCard(),
      bottomNavigationBar: SafeArea(child: Container(
        height: kToolbarHeight,
        margin: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2016/11/18/17/46/house-1836070__340.jpg'),
            radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:16.0, right:8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Comment as',
                    border: InputBorder.none
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                child: const Text('Post', style: TextStyle(
                  color: blueColor
                ),),
              )
            )
          ],
        ),
      )),
    );
  }
}