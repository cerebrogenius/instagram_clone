import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // return  Center(
    //   child:
    //   IconButton(onPressed: (){}, icon: const Icon(Icons.upload)),
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
        title: const Text('Post to'),
      actions: [
        TextButton(onPressed: (){}, child: const Text('Post', 
        style: TextStyle(
          color: Colors.blueAccent, 
          fontWeight: FontWeight.bold,
          fontSize: 16
          ),))
      ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
             const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage('https://images.news18.com/ibnlive/uploads/2021/07/1627448017_world-nature-conservation-day.png'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.4,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Write a caption',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(aspectRatio: 467/451,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://images.news18.com/ibnlive/uploads/2021/07/1627448017_world-nature-conservation-day.png'))
                  ),
                ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
