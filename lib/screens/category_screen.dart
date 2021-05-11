
import 'package:flutter/material.dart';
import 'package:task6/dummy_data.dart';
import 'package:task6/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((catData) =>
              CategoryItem(catData.id, catData.title, catData.color)
          ).toList(),
          gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio:   3/2,

          )),
    );
  }
}
