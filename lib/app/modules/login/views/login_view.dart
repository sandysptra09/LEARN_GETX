import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4,
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Form(
                        key: controller.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "LOGIN TO SMARTSTORE HOME",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                onChanged: loginController.onUsernameChanged,
                                decoration: InputDecoration(
                                    labelText: "Username",
                                    hintText: "Username",
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Input Email';
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: true,
                                onChanged: loginController.onPasswordChanged,
                                decoration: InputDecoration(
                                    labelText: "Password",
                                    hintText: "Password",
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Input Password';
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    if (controller.username.value.isNotEmpty &&
                                        controller.password.value.isNotEmpty) {
                                      controller.login();
                                    } else {
                                      Get.snackbar('Error',
                                          'Username and password cannot be empty');
                                    }
                                  }
                                },
                                child: Text("Submit"),
                              ),
                            ),
                            Container(
                                alignment: Alignment.bottomRight,
                                margin: EdgeInsets.only(
                                    top: 8, right: 10, left: 10),
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/register');
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ))
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
