import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/api.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final formKey = GlobalKey<FormState>();

  var username = ''.obs;
  var password = ''.obs;

  void onUsernameChanged(String value) {
    username.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  Future<void> login() async {
    try {
      var response = await _performLogin();
      var responseBody = json.decode(response.body);
      print(responseBody);

      if (response.statusCode == 200) {
        _saveUserData(responseBody);
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Login failed. ${responseBody['message']}');
      }
    } catch (e) {
      print('Error during login: $e');
      Get.snackbar('Error', 'An error occurred during login.');
    }
  }

  Future<http.Response> _performLogin() async {
    var apiUrl = 'auth/login';
    var requestBody = {'username': username.value, 'password': password.value};

    return await http.post(Uri.parse(Api.baseUrl + apiUrl),
        body: jsonEncode(requestBody),
        headers: {
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin": "*",
          'Accept': '/'
        });
  }

  void _saveUserData(Map<String, dynamic> responseBody) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', responseBody['token']);
    localStorage.setString('user', json.encode(responseBody['user']));
  }
}
