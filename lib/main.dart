import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memosphere/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
  runApp(const MemosPhere());
}

class MemosPhere extends StatelessWidget {
  const MemosPhere({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}