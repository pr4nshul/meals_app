import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  TabsScreen(this._favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;
  @override
  void initState() {
    super.initState();
    pages = [
      {'page': CategoryScreen(), 'bar': 'DeliMeals'},
      {'page': FavouritesScreen(widget._favoriteMeals), 'bar': 'Favourites'},
    ];
  }

  int selectedIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedIndex]['bar']),
      ),
      body: pages[selectedIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).accentColor,
        onTap: selectPage,
        currentIndex: selectedIndex,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: Colors.yellow,
            ),
            title: Text(
              'Category',
              style: TextStyle(color: Colors.yellow),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: Text(
              'Favourites',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
