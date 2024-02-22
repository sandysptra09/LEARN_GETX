import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learn_getx/app/modules/profile/views/profile_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                // Get.to(ProfileView());
              },
              child: Text("Go to Profile Page"),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/counter');
                  // Get.to(ProfileView());
                },
                child: Text("Go to Counter Page"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/biodata');
                  // Get.to(ProfileView());
                },
                child: Text("Go to Biodata Page"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/invoice');
                  // Get.to(ProfileView());
                },
                child: Text("Go to Invoice Page"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/login');
                  // Get.to(ProfileView());
                },
                child: Text("Go to Form Page"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
