import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildTile(String input, IconData icon, Function tapHandle) {
    return ListTile(
      title: Text(
        input,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: 'RobotoCondensed',
          fontSize: 26,
        ),
      ),
      leading: Icon(
        icon,
        size: 36,
      ),
      onTap: tapHandle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: Text(
                  'DeliMeals!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            buildTile(
              'Meals',
              Icons.restaurant_menu,
              (){
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            buildTile(
              'Settings',
              Icons.settings_applications,
              (){
                Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
