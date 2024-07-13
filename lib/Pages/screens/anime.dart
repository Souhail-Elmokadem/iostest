import 'package:flutter/material.dart';


class Anime extends StatelessWidget {

  String data;
  Anime({super.key,  required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data),
      ),
      body: Container(
        child: Text(data),
      ),
    );
  }
}
