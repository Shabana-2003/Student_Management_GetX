import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:student_management/constants/style/style.dart';
import 'package:student_management/controller/student_controller.dart';
import 'package:student_management/db/student_db.dart';
import 'package:student_management/pages/student_details/widget/detail_widget.dart';

class ScreenStudentDetails extends StatelessWidget {
  const ScreenStudentDetails({
    super.key,
    required this.index,
    required this.dataList,
  });
  final int index;
  final Student dataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        centerTitle: true,
        title: Text(
          dataList.name,
          style: appBarStyle,
        ),
      ),
      body: GetBuilder<StudentController>(
        init: StudentController(),
        builder: (StudentController data) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: FileImage(
                        File(dataList.image),
                      ),radius: 80,
                    ),
                  ),
                  SizedBox(height: 25,),
                  DetailsWidget(
                    studentDetails:
                        'Name${'     : ${dataList.name}'.toUpperCase()}',
                  ),
                  SizedBox(height: 25,),
                  DetailsWidget(
                    studentDetails: 'Age         : ${dataList.age}',
                  ),
                SizedBox(height: 25,),
                  DetailsWidget(
                    studentDetails:
                        'Domain${'  : ${data.list[index].domain}'.toUpperCase()}',
                  ),
                SizedBox(height: 25,),
                  DetailsWidget(
                    studentDetails: 'Number  : ${dataList.number}',
                  ),
                  SizedBox(height: 25,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
