import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:memosphere/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memosphere/notes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('thenotes');

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('thenotes');

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