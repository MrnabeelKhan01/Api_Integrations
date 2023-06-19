import 'package:flutter/material.dart';

import 'layout/body.dart';

class GeoView extends StatelessWidget {
  const GeoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black,
        title: const Text(
          "Get Map Api",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body:GeoBody(),
    );
  }
}
