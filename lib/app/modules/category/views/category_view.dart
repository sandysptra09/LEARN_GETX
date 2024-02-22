import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learn_getx/app/modules/category/views/category_create.dart';
import 'package:learn_getx/app/modules/category/views/category_edit.dart';
import 'package:learn_getx/app/modules/category/views/category_show.dart';
import '../../../data/category_models.dart';

import '../controllers/category_controller.dart';

class CategoryView extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Category'),
        // centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(CreateCategory());
              ;
            },
          ),
        ],
      ),
      body: Obx(
        () => categoryController.categoryList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: categoryController.categoryList.length,
                itemBuilder: (context, index) {
                  var category = categoryController.categoryList[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(2),
                    child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              category.categoryName.toString(),
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.to(
                                    () => UpdateCategory(category: category));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                Get.to(
                                    () => ShowCategoryView(category: category));
                              },
                              icon: Icon(Icons.visibility)),
                          IconButton(
                              onPressed: () {
                                // show confirmation dialog before deleting
                                showDeleteConfirmation(context, category);
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void showDeleteConfirmation(BuildContext context, Category category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Pasien'),
          content:
              Text('Are you sure you want to delete ${category.categoryName}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the deletePasien method from the controller
                categoryController.deleteCategory(category);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
