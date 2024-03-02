import 'package:hive_flutter/hive_flutter.dart';
import 'package:memosphere/notes.dart';

class Boxes {
  static Box<notes> getnotes() =>
    Hive.box<notes>('notes');
}