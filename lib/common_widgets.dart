import 'package:flutter/material.dart';

class TopScreenImage extends StatelessWidget {
  final Image screenImageName;

  const TopScreenImage({required this.screenImageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: screenImageName,
    );
  }
}

class ScreenTitle extends StatelessWidget {
  final String title;

  const ScreenTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
