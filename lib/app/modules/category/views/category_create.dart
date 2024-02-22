import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/category/controllers/category_controller.dart';

class CreateCategory extends StatelessWidget {
  final CategoryController categoryController = Get.find<CategoryController>();

  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController slugController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: categoryNameController,
              decoration: InputDecoration(labelText: "Category name"),
            ),
            TextFormField(
              controller: slugController,
              decoration: InputDecoration(labelText: "Slug"),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_validateInput()) {
                    categoryController.createCategory(
                        categoryNameController.text, slugController.text);
                  }
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (categoryNameController.text.isEmpty || slugController.text.isEmpty) {
      Get.snackbar("Error", "Form cannot empty");
      return false;
    }
    return true;
  }
}
