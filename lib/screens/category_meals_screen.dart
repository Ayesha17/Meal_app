import 'package:flutter/material.dart';

import '../data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category_meal';

  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen({required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final filterMeal = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(filterMeal[index].title);
           },
          itemCount: filterMeal.length,
        ));
  }
}
