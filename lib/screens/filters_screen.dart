import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Map<String, bool> _filters;
  final Function setFilters;
  FiltersScreen(this.setFilters, this._filters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isVeg = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;
  bool _isGlutenFree = false;
  @override
  initState(){
    super.initState();
    _isGlutenFree= widget._filters['gluten'];
    _isVegan= widget._filters['Vegan'];
    _isVeg= widget._filters['Veg'];
    _isLactoseFree= widget._filters['lactose'];
  }
  Widget _buildFilter(
      String description, String title, bool value, Function change) {
    return SwitchListTile(
      onChanged: change,
      value: value,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.check_circle_outline,
                size: 30,
              ),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'Vegan': _isVegan,
                  'Veg': _isVeg,
                };
                widget.setFilters(selectedFilters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              color: Colors.black,
              child: Center(
                child: Text(
                  'Choose your Food Settings',
                  style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildFilter(
                      'Show Vegetarian meals only', 'Vegetarian', _isVeg,
                      (bool newValue) {
                    setState(
                      () {
                        _isVeg = newValue;
                      },
                    );
                  }), //buildFilter
                  _buildFilter('Show Vegan meals only', 'Vegan', _isVegan,
                      (newValue) {
                    setState(
                      () {
                        _isVegan = newValue;
                      },
                    );
                  }), //buildFilter
                  _buildFilter('Show Lactose free meals only', 'Lactose Free',
                      _isLactoseFree, (newValue) {
                    setState(
                      () {
                        _isLactoseFree = newValue;
                      },
                    );
                  }), //buildFilter
                  _buildFilter('Show Gluten Free meals only', 'Gluten Free',
                      _isGlutenFree, (newValue) {
                    setState(
                      () {
                        _isGlutenFree = newValue;
                      },
                    );
                  }), //buildFilter
                ],
              ),
            )
          ],
        ));
  }
}
