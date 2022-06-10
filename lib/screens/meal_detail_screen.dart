import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  final Function addFravorite;
  final Function isFavorite;

  MealDetailScreen(this.addFravorite,this.isFavorite);

  Widget buildHeader(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildChild(Widget child) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
            border: Border.all(color: Colors.black45)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

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
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
            height: 300,
            width: double.infinity,
          ),
          buildHeader(context, "Ingredients"),
          buildChild(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  child: Text(
                    meal.ingredients[index],
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
              ),
              itemCount: meal.ingredients.length,
            ),
          ),
          buildHeader(context, "Steps"),
          buildChild(
            ListView.builder(
              itemBuilder: (ctx, index) => Column(children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(meal.steps[index]),
                ),
                const Divider(
                  height: 2,
                )
              ]),
              itemCount: meal.steps.length,
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addFravorite(mealId);
          // Navigator.of(context).pop(mealId);
        },
        child:   Icon(
          isFavorite(mealId)?Icons.star:Icons.star_border,
          // Icons.star_border_outlined,
          // color: Colors.black45,
        ),
      ),
    );
  }
}
