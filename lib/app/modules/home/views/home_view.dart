import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learn_getx/app/modules/category/views/category_view.dart';
import 'package:learn_getx/app/modules/login/views/login_view.dart';
import 'package:learn_getx/app/modules/profile/views/profile_view.dart';

import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
              child: Text("Go to Profile Page"),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.grey,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
                GButton(
                  icon: Icons.collections_bookmark_outlined,
                  text: 'Invoice',
                ),
                GButton(
                  icon: Icons.account_tree_outlined,
                  text: 'Category',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                (() {
                  _selectedIndex = index;
                });
                switch (index) {
                  case 0:
                    Get.toNamed('/home');
                    break;
                  case 1:
                    Get.toNamed('/profile');
                    break;
                  case 2:
                    Get.toNamed('/invoice');
                    break;
                  case 3:
                    Get.toNamed('/category');
                    break;
                  default:
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
