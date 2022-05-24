import 'package:flutter/material.dart';
import 'package:meal_app/data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
            height: 300,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white,
              border: Border.all(color: Colors.black45)
            ),
            height: 200,
            width: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Text(meal.ingredients[index]),
              ),
              itemCount: meal.ingredients.length,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // child: Image.asset(Icons.star_outlined),
      ),
    );
  }
}
