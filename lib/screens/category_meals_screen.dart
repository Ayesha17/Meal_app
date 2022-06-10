import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category_meal';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<StatefulWidget> createState() => _CategoryMealsScreen();
}

class _CategoryMealsScreen extends State<CategoryMealsScreen> {
  late String? categoryId;
  late String? categoryTitle;
  late List<Meal> filterMeal;
  bool _loadInitData = false;

  //
  // CategoryMealsScreen({required this.categoryId, required this.categoryTitle});

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      categoryId = routeArgs['id'];
      filterMeal = widget.availableMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      // print("ste");
      filterMeal.removeWhere((element) =>  element.id == mealId );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$categoryTitle'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                filterMeal[index].id,
                filterMeal[index].title,
                filterMeal[index].imageUrl,
                filterMeal[index].duration,
                filterMeal[index].complexity,
                filterMeal[index].affordability
                // ,  _removeMeal
            );
          },
          itemCount: filterMeal.length,
        ));
  }
}
