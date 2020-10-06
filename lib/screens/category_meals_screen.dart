import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title ;
  List<Meal> categoryMeals;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    title = routeArgs['title'];
    final String id = routeArgs['id'];
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: categoryMeals[index].title,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              id: categoryMeals[index].id,
              imageUrl: categoryMeals[index].imageUrl,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
