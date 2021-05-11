import 'package:flutter/material.dart';
import 'package:task6/models/meal.dart';
import 'category_item.dart';

class MealItem extends StatelessWidget {
  final id;
  final imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(

      {@required this.id,
        @required this.imageUrl,
      @required this.title,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});
  String get  comptext {
  switch(complexity){
    case Complexity.Simple : return 'Simple'; break;
    case Complexity.Challenging : return 'Challenging'; break;
    case Complexity.Hard : return 'Hard'; break;
    default :return 'unKnown'; break;
  }
  }

  String get affortext{
    switch(affordability){
      case Affordability.Affordable :return 'Affordable';break;
      case Affordability.Pricey :return 'Pricey';break;
      case Affordability.Luxurious :return 'Luxurious';break;
      default :return 'unKnown'; break;

    }

  }
  void selectmeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed('///',arguments:id, );

  }
  @override
  Widget build(BuildContext context) {



    return InkWell(
      onTap: () =>selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(imageUrl),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                 Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,

                      ),
                    ),
                  ),

              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 6),
                    Text('$duration min'),
                  ],
                ),
                Row(children: [
                  Icon(Icons.work),
                  SizedBox(width: 6),
                  Text('$comptext'),
                ],),
                Row(children: [
                  Icon(Icons.attach_money),
                  SizedBox(width: 6),
                  Text('$affortext'),
                ],),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
