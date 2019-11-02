import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  PageTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0),
      ),
    );
  }
}
