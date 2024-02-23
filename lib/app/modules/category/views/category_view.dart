import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learn_getx/app/modules/category/views/category_create.dart';
import 'package:learn_getx/app/modules/category/views/category_edit.dart';
import 'package:learn_getx/app/modules/category/views/category_show.dart';
import '../../../data/category_models.dart';

import '../controllers/category_controller.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class CategoryView extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  int _selectedIndex = 3;
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
                  return Card(
                    elevation: 4, // Tinggi bayangan card
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      title: Text(
                        category.categoryName.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Wrap(
                        spacing: 12, // Jarak antar ikon
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(() => UpdateCategory(category: category));
                            },
                            icon: Icon(Icons.edit),
                            color: Colors.blue,
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(
                                  () => ShowCategoryView(category: category));
                            },
                            icon: Icon(Icons.visibility),
                            color: Colors.green,
                          ),
                          IconButton(
                            onPressed: () {
                              // Tampilkan dialog konfirmasi sebelum menghapus
                              showDeleteConfirmation(context, category);
                            },
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
