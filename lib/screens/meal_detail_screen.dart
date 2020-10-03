import 'package:flutter/material.dart';
class MealScreenDetail extends StatelessWidget {
  static const routeName = '/mealDetail-screen';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: Center(
        child: Text(mealId),
      ),
    );
  }
}