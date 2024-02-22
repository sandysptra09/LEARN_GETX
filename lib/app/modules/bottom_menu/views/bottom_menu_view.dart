import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/category/views/category_view.dart';
import 'package:learn_getx/app/modules/home/views/home_view.dart';
import 'package:learn_getx/app/modules/profile/views/profile_view.dart';
import '../controllers/bottom_menu_controller.dart';

class BottomMenuView extends StatelessWidget {
  final BottomMenuController bottomMenuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: bottomMenuController.currentIndex.value,
            children: [
              HomeView(),
              CategoryView(),
              ProfileView(),
            ],
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: bottomMenuController.currentIndex.value,
          onTap: (index) {
            bottomMenuController.changePage(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Category',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: 'Profil',
            // ),
          ],
        ),
      ),
    );
  }
}
