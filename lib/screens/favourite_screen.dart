import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../widgets/meal_item.dart';
class FavouritesScreen extends StatelessWidget {
  final List<Meal> _favoritesMeals;

  FavouritesScreen(this._favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoritesMeals.isEmpty) {
      return Center(
        child: Text(
          'No favourites add some',
          style: TextStyle(
            fontSize: 26,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: _favoritesMeals[index].title,
            affordability: _favoritesMeals[index].affordability,
            complexity: _favoritesMeals[index].complexity,
            duration: _favoritesMeals[index].duration,
            id: _favoritesMeals[index].id,
            imageUrl: _favoritesMeals[index].imageUrl,
          );
        },
        itemCount: _favoritesMeals.length,
      );
    }
  }
}
