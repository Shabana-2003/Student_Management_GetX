import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/constants/style/style.dart';
import 'package:student_management/pages/homescreen/text_form.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 110, 209, 248),
        title: Text(
          'Student Details',
          style: appBarStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add),
            onPressed: (() {
              Get.to(
                () => const TextForm(),
              );
            }),
            label: Text(
              'Add Student',
              style: butttonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
