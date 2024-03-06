// import 'package:flutter/material.dart';
// import 'package:student_management/pages/homescreen/home_screen.dart';
// import 'package:student_management/pages/listscreen/student_list_screen.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});
  
//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   int currentSelectedIndex = 0;

//   List pages = [
//    const ScreenHome(),
//    ListStudentScreen()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentSelectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentSelectedIndex,
//         onTap: (newIndex) {
//           setState(() {
//             currentSelectedIndex = newIndex;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'List',
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/controller/student_controller.dart';
import 'package:student_management/pages/homescreen/home_screen.dart';
import 'package:student_management/pages/listscreen/student_list_screen.dart';

class BottomNav extends StatelessWidget {
  final StudentController controller = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.currentSelectedIndex.value,// currentSelectedIndex : variable name
          children: [
           const ScreenHome(),
            ListStudentScreen(),
          ],
        );
      }),
      bottomNavigationBar:
       Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentSelectedIndex.value,
          onTap: (newIndex) {
            controller.changePage(newIndex);//calling the function
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
          ],
        );
      }),
    );
  }
}


