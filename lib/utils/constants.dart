import 'package:flutter/material.dart';

import '../screens/add_post_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  Center(child: Text('Home')),
  Center(child: Text('Search')),
  AddPostScreen(),
  Center(child: Text('Favourite')),
  Center(child: Text('Account'))
];
