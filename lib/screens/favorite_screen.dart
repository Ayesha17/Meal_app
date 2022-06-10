import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite';
  final List<Meal> favoriteMeals;
FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
   if(favoriteMeals.isEmpty) {
     return   Center(
        child: Text('Favorite Screen'),
    );
   } else {
     return ListView.builder(
       itemBuilder: (ctx, index) {
         return MealItem(
             favoriteMeals[index].id,
             favoriteMeals[index].title,
             favoriteMeals[index].imageUrl,
             favoriteMeals[index].duration,
             favoriteMeals[index].complexity,
             favoriteMeals[index].affordability
              );
       },
       itemCount: favoriteMeals.length,
     );
   }

  }
}
