import 'package:flutter/material.dart';
import 'package:task6/widgets/meal_item.dart';
import 'package:task6/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> _availablemeals;


  CategoryMealsScreen(this._availablemeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  @override
  Widget build(BuildContext context) {

    final routearg=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryid=routearg['id'];
    final categorytitle=routearg['title'];
    final categorymeals=widget._availablemeals.where((meal) =>meal.categories.contains(categoryid)).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categorytitle),
      ),
      body: ListView.builder(itemBuilder:(ctx,index){
        return MealItem(
          id:categorymeals[index].id,
          imageUrl: categorymeals[index].imageUrl,
          title:categorymeals[index].title ,
          affordability: categorymeals[index].affordability,
          complexity: categorymeals[index].complexity,
          duration: categorymeals[index].duration,

        );
      },
      itemCount:categorymeals.length,
      )
    );
  }
}
