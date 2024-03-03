import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management/controller/student_controller.dart';
import 'package:student_management/db/student_db.dart';
import 'package:student_management/pages/bottom_nav.dart';

late Box<Student> studentDb;  //late : the variable will be initialized later before its first use.
// Box : This box is going to hold instances of the Student class.
final StudentController studentController = Get.put(StudentController());// studentController: variable // Get.put(StudentController() : This part initializes an instance of the StudentController class.
//Get.put(): This is a method provided by the Get package. It's like a magic wand that creates an instance of the specified class. By passing StudentController() inside Get.put(), we're telling Get 
//to create an instance of StudentController and put it into a special storage space that Get manages.


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure that Flutter widgets are initialized
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter());  // Register the adapter for the Student class
  studentDb = await Hive.openBox<Student>('student');  // Open a box named 'student' to store Student objects
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
