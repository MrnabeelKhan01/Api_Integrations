import 'package:flutter/material.dart';

import 'layout/body.dart';

class PhotosView extends StatelessWidget {
  const PhotosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black,
        title: const Text(
          "Get Photos Api",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body:PhotosBody(),
    );
  }
}
