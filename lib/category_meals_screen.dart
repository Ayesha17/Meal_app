import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen({required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs= ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final categoryTitle=routeArgs['title'];
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: const Center(
          child: Text('The Recipes for the Category'),
        ));
  }
}
