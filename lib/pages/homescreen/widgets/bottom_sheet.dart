import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/constants/style/style.dart';
import 'package:student_management/controller/student_controller.dart';
import 'package:student_management/pages/homescreen/widgets/bottom_sheet_icon.dart';

class PhotoBottomSheet extends StatelessWidget {
  const PhotoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        children: [
          ListTileWidget(
            onTap: () async {
              Get.find<StudentController>().getCamera();
              Get.back();
            },
            icon: const Icon(
              Icons.camera_alt,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              'Camera',
              style: bottomSheetText,
            ),
          ),
          ListTileWidget(
            onTap: () async {
              Get.find<StudentController>().getGallery();
              Get.back();
            },
            icon: const Icon(
              Icons.collections,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              'Gallery',
              style: bottomSheetText,
            ),
          ),
        ],
      ),
    );
  }
}
