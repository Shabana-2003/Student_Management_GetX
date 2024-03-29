import 'package:hive/hive.dart';
part 'student_db.g.dart';

@HiveType(typeId: 1)
class Student extends HiveObject {
  Student(
      {this.id,
      required this.image,
      required this.name,
      required this.age,
      required this.domain,
      required this.number});

  @HiveField(0)//This property represents the unique identifier of the student. It's annotated with @HiveField(0) to indicate that it should be stored in the Hive database with index 0.
  int? id;

  @HiveField(1)
  final String image;

  @HiveField(2)
  final String name;//represents the name of the student.

  @HiveField(3)
  final String age;

  @HiveField(4)
  final String domain;

  @HiveField(5)
  final String number;
}
