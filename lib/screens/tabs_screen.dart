import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/screens/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  List<Widget> _pages = [
    CategoriesScreen(
      title: 'Meals',
    ),
    FavoriteScreen()
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  //Bottom Navigation bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star_border),
              label: 'Favorite')
        ],
      ),
    );
  }

//top Bar

// @override
// Widget build(BuildContext context) {
//   return DefaultTabController(
//       length: 2,
//       initialIndex: 1, //start from or select the screen bydefault
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Meals'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favorites',
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [CategoriesScreen(title: 'DeliMeals'), FavoriteScreen()],
//         ),
//       ));
// }
}
