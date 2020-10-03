import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(14),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 18,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(catData.id,catData.color, catData.title),
          )
          .toList(),
    );
  }
}
