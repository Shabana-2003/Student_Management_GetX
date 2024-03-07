import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/constants/core/constrains.dart';
import 'package:student_management/constants/style/style.dart';
import 'package:student_management/pages/homescreen/text_form.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:backgroundcolor,
        title: Text(
          'Student Details',
          style: appBarStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            kheight120,
            Image.asset('lib/constants/image/studentimage.png'),
            kheight20,
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Get.to(() => const TextForm());
                },
                label: Text(
                  'Add Student',
                  style: butttonTextStyle,
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                        250, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          50),
                    ),
                   backgroundColor:backgroundcolor,
                    ),
              ),
            ),
            kheight5
          ],
        ),
      ),
    );
  }
}
