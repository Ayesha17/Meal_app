import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/main_drawer.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Screen'),

      ),
      drawer: MainDrawer(),
      body: const Center(
        child: Text('Favorite Screen'),
      ),
    );
  }
}
