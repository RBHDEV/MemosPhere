import 'package:flutter/material.dart';
import 'package:memosphere/home.dart';

void main() {
  runApp(const MemosPhere());
}

class MemosPhere extends StatelessWidget {
  const MemosPhere({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}