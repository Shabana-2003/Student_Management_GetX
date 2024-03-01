import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/constants/style/style.dart';
import 'package:student_management/controller/student_controller.dart';
import 'package:student_management/db/student_db.dart';
import 'package:student_management/main.dart';
import 'package:student_management/pages/bottom_nav.dart';
import 'package:student_management/pages/homescreen/widgets/bottom_sheet.dart';
import 'package:student_management/pages/homescreen/widgets/text_form_widget.dart';

final TextEditingController namController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController domainController = TextEditingController();
final TextEditingController numberController = TextEditingController();

File? image;

class TextForm extends StatelessWidget {
  const TextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 110, 209, 248),
        title: Text(
          'Add student details',
          style: appBarStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: GetBuilder<StudentController>(
            init: StudentController(),
            builder: (StudentController data) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          SizedBox(height: 20,),
                          CircleAvatar(
                             backgroundColor: Color.fromARGB(255, 95, 202, 244) ,
                            backgroundImage: data.pickedImageFromGallery != null
                                ? FileImage(
                                    File(
                                      data.pickedImageFromGallery!,
                                    ),
                                  ) as ImageProvider
                                : const AssetImage(
                                    'assets/images/no-photo.png',
                                  ),
                          ),
                          Positioned(
                            bottom: 14,
                            right: -5,
                            child: MaterialButton(
                              onPressed: () {
                                Get.bottomSheet(
                                  const PhotoBottomSheet(),
                                  backgroundColor:Color.fromARGB(255, 95, 217, 248),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.add_a_photo,
                                color: Color.fromARGB(255, 0, 0, 0),
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24,),
                    TextFormWidget(
                      prefixIcon: Icons.person,
                      hintText: 'Enter your name',
                      controller: namController,
                    ),
                     SizedBox(height: 24,),
                    TextFormWidget(
                      prefixIcon: Icons.numbers,
                      hintText: 'Enter your age',
                      controller: ageController,
                      keyboardType: TextInputType.number,
                    ),
                   SizedBox(height: 24,),
                    TextFormWidget(
                      prefixIcon: Icons.developer_mode,
                      hintText: 'Enter your domain',
                      controller: domainController,
                    ),
                   SizedBox(height: 24,),
                    TextFormWidget(
                      prefixIcon: Icons.phone_android_outlined,
                      hintText: 'Enter your phone number',
                      controller: numberController,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 60,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ElevatedButton(
                        //   onPressed: () {
                        //     submitButtonClicked();
                        //   },
                        //   child: const Text('Submit'),
                        // ),
                        ElevatedButton(
                onPressed: () {
                    submitButtonClicked();
                },
                child:const Text(
                  'Submit',
                  style: TextStyle(color: Color.fromARGB(255, 81, 81, 81)),
                ),
                style: ElevatedButton.styleFrom(
                  // Change size
                  minimumSize:
                      Size(150, 70), // You can adjust these values accordingly

                  // Change border radius
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(50), // You can adjust this value
                  ),

                  // Change background color
                  primary: Color.fromARGB(255, 95, 202, 244) // You can replace 'Colors.blue' with any color you want
                ),
              ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> submitButtonClicked() async {
    final image = studentController.pickedImageFromGallery;
    final name = namController.text.trim();
    final age = ageController.text.trim();
    final domain = domainController.text.trim();
    final number = numberController.text.trim();

    if (name.isEmpty || age.isEmpty || domain.isEmpty || number.isEmpty) {
      Get.snackbar('Warning', 'All fields are required',
          duration: const Duration(seconds: 1),
          titleText: Center(
            child: Text(
              'Warning',
              style: warningTitle,
            ),
          ),
          messageText: Center(
            child: Text(
              'All fields are required',
              style: warningMessage,
            ),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(255, 255, 7, 7),
          colorText: Colors.white,
          maxWidth: double.infinity,
          margin: const EdgeInsets.all(10));
    } else {
      final Student addToDataBase = Student(
        image: image!,
        name: name,
        age: age,
        domain: domain,
        number: number,
      );

      Get.offAll(() => const BottomNav());
      Get.snackbar('title', 'message',
          duration: const Duration(seconds: 1),
          titleText: Center(
            child: Text(
              'Success',
              style: snackTitle,
            ),
          ),
          messageText: Center(
            child: Text(
              'Successfully added',
              style: snackMessage,
            ),
          ),
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: double.infinity,
          backgroundColor: Colors.green,
          margin: const EdgeInsets.all(10));
      studentController.pickedImageFromGallery = null;
      namController.clear();
      ageController.clear();
      domainController.clear();
      numberController.clear();
      studentController.addStudentList(addToDataBase);
    }
  }
}
