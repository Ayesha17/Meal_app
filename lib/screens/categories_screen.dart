import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/data.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  String title;

  CategoriesScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      // body:
      GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(catData.id,catData.title, catData.color))
            .toList(),
      );
    // );
  }
}
