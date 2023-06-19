import 'package:flutter/material.dart';

import 'presentation/photos/photos_view.dart';
import 'presentation/user/user_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData(), home: PhotosView());
  }
}
