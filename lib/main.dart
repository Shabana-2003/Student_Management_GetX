import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management/controller/student_controller.dart';
import 'package:student_management/db/student_db.dart';
import 'package:student_management/pages/bottom_nav.dart';

late Box<Student> studentDb;
final StudentController studentController = Get.put(StudentController());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter());
  studentDb = await Hive.openBox<Student>('student');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Student management',
      debugShowCheckedModeBanner: false,
      home: const BottomNav(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
