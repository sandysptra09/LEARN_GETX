import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  int _selectedIndex = 1; // Index untuk tab Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => controller.logout(), icon: Icon(Icons.logout))
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Nama: ${controller.user['username']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Email: ${controller.user['email']}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
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
