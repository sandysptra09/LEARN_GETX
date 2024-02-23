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
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: categoryNameController,
                  decoration: InputDecoration(labelText: "Category name"),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: slugController,
                  decoration: InputDecoration(labelText: "Slug"),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_validateInput()) {
                      categoryController.createCategory(
                        categoryNameController.text,
                        slugController.text,
                      );
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
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
