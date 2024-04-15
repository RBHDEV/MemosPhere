import 'package:flutter/material.dart';

void main() {
  runApp(const memosphere());
}

class memosphere extends StatelessWidget {
  const memosphere({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
