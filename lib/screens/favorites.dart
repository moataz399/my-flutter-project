import 'package:flutter/material.dart';
import 'package:task6/models/meal.dart';
import 'package:task6/widgets/meal_item.dart';
class Favorites extends StatelessWidget {
  final List<Meal> favoriteMeals ;

  Favorites(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if (favoriteMeals.isEmpty){
      return Center(
        child: Text('you have no favorite yet - start adding some!'),
      );
    }else{
return  ListView.builder(itemBuilder:(ctx,index){
  return MealItem(
    id:favoriteMeals [index].id,
    imageUrl: favoriteMeals[index].imageUrl,
    title:favoriteMeals[index].title ,
    affordability: favoriteMeals [index].affordability,
    complexity: favoriteMeals[index].complexity,
    duration: favoriteMeals[index].duration,

  );
},
  itemCount:favoriteMeals.length,
);
    }

  }
}
