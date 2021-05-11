import 'package:flutter/material.dart';
import 'package:task6/screens/category_screen.dart';
import 'package:task6/screens/favorites.dart';
import 'package:task6/widgets/main_drawer.dart';
import 'package:task6/models/meal.dart';
class TabsScreen extends StatefulWidget {
 final List<Meal> favoriteMeals ;

 TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _pages;
@override
  void initState() {
  _pages  =[
  {
  'page':CategoriesScreen(),
  'title':'Categories'
  },
  {
  'page':Favorites(widget.favoriteMeals),
  'title':'your Favorites'
  }
  ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[selectedpageindex]['title']),
      ),
      body:_pages[selectedpageindex]['page'] ,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex:selectedpageindex ,
        onTap: _selectpage,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.category) ,title:Text('category'), ),
          BottomNavigationBarItem(icon:Icon(Icons.star) ,title:Text('Favorites'), )
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  int selectedpageindex=0;

  void _selectpage(int value  ) {
  setState(() {
    selectedpageindex=value;
  });
  }
}
