import 'package:flutter/material.dart';


class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical:18, horizontal: 16 ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2016/11/18/17/46/house-1836070__340.jpg'),
          radius:18 ,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'username',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                     TextSpan(
                      text: 'description',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    )
                  ]
                ))
              ]
            ),
          )
        ],
      ),
    );
  }
}