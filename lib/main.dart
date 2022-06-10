import 'package:flutter/material.dart';
import 'package:meal_app/data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';

import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] == true && !element.isGlutenFree) return false;
        if (_filters['lactose'] == true && !element.isLactoseFree) return false;
        if (_filters['vegan'] == true && !element.isVegan) return false;
        if (_filters['vegetarian'] == true && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toogleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    setState(() {
      if (existingIndex >= 0) {
        _favoriteMeals.removeAt(existingIndex);
      } else {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
      }
    });

  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((element) => element.id==id);
  }
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deli Meal',
      theme: ThemeData(
// This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
          fontFamily: 'Raleway',
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
            titleLarge: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18,
                fontWeight: FontWeight.bold),
// bodyText1:
//     const TextStyle(color: Color.fromRGBO(20, 51, 51, 1))
          )),
// home: CategoriesScreen(title: 'DeliMeals'),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toogleFavorite,_isMealFavorite),
        FilterScreen.routeName: (context) => FilterScreen(_filters, _setFilters)
      },
    );
  }
}
