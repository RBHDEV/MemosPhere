import 'package:isar/isar.dart';

part 'Notes.g.dart';

@collection
class Notes {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? title;

  String? content;

  DateTime? createddate;
}
