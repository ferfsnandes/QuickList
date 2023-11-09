import 'package:flutter/material.dart';

class TopScreenImage extends StatelessWidget {
  final Image screenImageName;

  const TopScreenImage({super.key, required this.screenImageName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 100.0,
      child: screenImageName,
    );
  }
}

class ScreenTitle extends StatelessWidget {
  final String title;

  const ScreenTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
