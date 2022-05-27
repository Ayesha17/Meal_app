import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favorite_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildList('Meals', Icons.restaurant,
              () => {Navigator.of(context).pushReplacementNamed('/')}),
          buildList('Filters', Icons.settings, () => {Navigator.of(context).pushReplacementNamed(FavoriteScreen.routeName)})
        ],
      ),
    );
  }

  Widget buildList(String title, IconData icon, Function() tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Raleway', fontSize: 16, fontWeight: FontWeight.w300),
      ),
      onTap: tapHandler,
    );
  }
}
