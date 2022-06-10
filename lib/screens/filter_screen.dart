import 'package:flutter/material.dart';
import 'package:meal_app/screens/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter_screen';
  final Function saveFilter;
 final Map<String, bool>  filters;
  FilterScreen(@required this.filters,@required this.saveFilter);

  // FilterScreen(@required this.saveFilter);
  @override
  State<StatefulWidget> createState() => _FilterScreen();
}

class _FilterScreen extends State<FilterScreen> {
  bool  _glutenFree = false;
  bool  _vegetarian = false;
  bool  _vegan = false;
  bool  _lactoseFree = false;

  @override
  void initState() {
    _glutenFree=widget.filters['gluten']!;
    _lactoseFree=widget.filters['lactose']!;
    _vegan=widget.filters['vegan']!;
    _vegetarian=widget.filters['vegetarian']??false;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
              final  selectedfilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };

                widget.saveFilter(selectedfilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten-free', 'Only include gluten free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile('Lactose-free',
                  'Only include lactose free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildSwitchListTile(
      String title, String desc, bool currentValue, updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(desc),
        value: currentValue,
        onChanged: updateValue);
  }
}
