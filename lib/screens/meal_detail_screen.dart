import 'package:flutter/material.dart';
import 'package:task6/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function tooglefav;
  final Function isfav;
  MealDetailScreen(this.tooglefav,this.isfav);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == id,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
              'ingredients',
              style: Theme.of(context).textTheme.title,
            )),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width:300,
              height: 150,
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount:selectedmeal.ingredients.length ,
                itemBuilder: (ctx,index)=> Card(
                  color: Theme.of(context).accentColor,
                  child: Text('${selectedmeal.ingredients[index]}',),

                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'steps',
                  style: Theme.of(context).textTheme.title,
                )),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              width:300,
              height: 150,
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount:selectedmeal.steps.length ,
                itemBuilder: (ctx,index)=>
                   Column(
                     children: [
                       ListTile(
                         leading: CircleAvatar(
                           child: Text('${index+1}'),
                         ),
                         title: Text('${selectedmeal.steps[index]}'),
                       ),
                       Divider(),
                     ],
                   )
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> tooglefav(id),
        child: Icon( isfav(id) ? Icons.add :Icons.star_border,
        ),
      ),
    );
  }
}
