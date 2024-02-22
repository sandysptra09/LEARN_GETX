import 'package:flutter/material.dart';
import 'package:learn_getx/app/modules/category/controllers/category_controller.dart';
import '../../../data/category_models.dart';
import 'package:get/get.dart';

class UpdateCategory extends StatelessWidget {
  final CategoryController categoryController = Get.find();
  final Category category;
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController slugController = TextEditingController();

  UpdateCategory({required this.category}) {
    categoryNameController.text = category.categoryName.toString();
    slugController.text = category.slug.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Pasien'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: categoryNameController,
              decoration: InputDecoration(labelText: 'Category Name'),
            ),
            TextFormField(
              controller: slugController,
              decoration: InputDecoration(labelText: 'Slug'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInput()) {
                  // Always call the editPasien method without any conditional checks
                  categoryController.updateCategory(
                    category,
                    categoryNameController.text,
                    slugController.text,
                  );
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (categoryNameController.text.isEmpty || slugController.text.isEmpty) {
      Get.snackbar('Error', 'Form cannot empty');
      return false;
    }
    return true;
  }
}
