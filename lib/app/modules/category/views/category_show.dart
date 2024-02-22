import 'package:flutter/material.dart';
import '../../../data/category_models.dart';

class ShowCategoryView extends StatelessWidget {
  final Category category;

  ShowCategoryView({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${category.categoryName}'),
          ],
        ),
      ),
    );
  }
}
