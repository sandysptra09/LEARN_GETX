import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Api {
  static final String baseUrl = 'http://10.10.10.243:8080/api/smartstore/';

  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    if (token != null) {
      return {'Authorization': 'Bearer $token'};
    } else {
      return {};
    }
  }
}
