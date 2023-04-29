import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: mobileBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                  .copyWith(right: 0),
              child: Row(children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2014/12/24/05/02/drop-of-water-578897__480.jpg'),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:const [
                            Text('username',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ])),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              child: ListView(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shrinkWrap: true,
                                  children: [
                                    'Delete', 'Allow'
                                  ].map((e) => InkWell(
                                    onTap: (){},
                                    child: Container(
                                      padding:const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                      child: Text(e),),
                                  )).toList()),
                            ));
                  },
                  icon: const Icon(Icons.more_vert),
                )
              ]),
            ),SizedBox(
              height: MediaQuery.of(context).size.height*0.35,
              width: double.infinity,
              child: Image.network(
                'https://cdn.pixabay.com/photo/2014/12/24/05/02/drop-of-water-578897__480.jpg',
                fit: BoxFit.cover
              )
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.favorite,color: Colors.red)
                    ),
                     IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.comment_outlined)
                    ),
                      IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.send)
                    ),
                    Expanded(
                      child: Align(alignment: Alignment.bottomRight,
                      child:   IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.bookmark_border)
                    ),
                      ),), 

                ]
              ),
              Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w300),
                        child: Text(
                          '1,231 likes',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top:8
                        ),
                        child: RichText(text: const TextSpan(
                          style: TextStyle(
                            color: primaryColor
                          ),
                          children:  [
                            TextSpan(
                              text: 'username',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                            TextSpan(text: ':  hey this is some description to be replaced')
                          ]
                        )),
                      )
                    ],
                  )
                )
          ],
        ));
  }
}
