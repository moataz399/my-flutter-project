import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
  void selectcategory (BuildContext ctx){
    Navigator.of(ctx).pushNamed('//',arguments: {
      'id':id,
      'title':title,
    });
  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        return selectcategory(context);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title,) ,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withOpacity(.4), color],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
