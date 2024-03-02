import 'package:hive/hive.dart';

part 'notes.g.dart';

@HiveType(typeId: 1)
class notes {
  notes({required this.id, required this.title, required this.content, required this.createdDate});
  
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String content;

  @HiveField(4)
  late DateTime createdDate;
}