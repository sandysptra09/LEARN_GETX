import 'dart:convert';

import 'package:learn_getx/app/modules/category/views/category_show.dart';
import 'package:learn_getx/app/routes/app_pages.dart';

import '../../../data/category_models.dart';
import '../../../providers/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  var categoryList = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // function get all category
  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}categories';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)["data"]['rows'];
        print("$jsonResponse");
        categoryList
            .assignAll(jsonResponse.map((model) => Category.fromJson(model)));
      } else {
        throw Exception(
            'Failed to load all categories: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error during fetching categories: $e');
    }
  }

  // function for create category
  Future<void> createCategory(
    String? categoryName,
    String? slug,
    // String? createdAt,
    // String? updatedAt,
  ) async {
    try {
      if (categoryName == null || slug == null) {
        Get.snackbar('Error', 'form cannot empty');
        return;
      }

      var apiUrl = '${Api.baseUrl}category';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'category_name': categoryName,
          'slug': slug,
          // 'createdAt': createdAt,
          // 'updatedAt': updatedAt,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Category successfully added!');
        fetchData();
        Get.offAndToNamed(Routes.BOTTOM_MENU); // Redirect ke halaman category
      } else {
        throw Exception('Failed to add category');
      }
    } catch (e) {
      print('Error during add category: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  // function for update category
  Future<void> updateCategory(
    Category category,
    String? categoryName,
    String? slug,
    // String? createdAt,
    // String? updatedAt,
  ) async {
    try {
      if (categoryName == null || slug == null) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}category/${category.id}';
      var headers = await Api.getHeaders();

      var response = await http.put(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'category_name': categoryName,
          'slug': slug,
          // 'createdAt': createdAt,
          // 'updatedAt': updatedAt,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Category success updated');
        fetchData(); // Refresh the pasienList
        Get.offAndToNamed(Routes.BOTTOM_MENU);
      } else {
        throw Exception('Failed to update category');
      }
    } catch (e) {
      print('Error during update category: $e');
    }
  }

  // show category
  void showCategoryDetails(Category category) {
    Get.to(() => ShowCategoryView(category: category));
  }

  // function for delete category
  Future<void> deleteCategory(Category category) async {
    try {
      var apiUrl = '${Api.baseUrl}category/${category.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Category success deleted');
        fetchData();
        // Optionally, you can navigate to a different page after deletion
      } else {
        throw Exception('Failed to delete category');
      }
    } catch (e) {
      print('Error during delete category: $e');
    }
  }
}
