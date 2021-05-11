import 'package:flutter/material.dart';
import 'package:task6/dummy_data.dart';
import 'package:task6/models/meal.dart';
import 'package:task6/screens/category_meals_screen.dart';
import 'package:task6/screens/category_screen.dart';
import 'package:task6/screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'Vegetarian': false,
  };

  List<Meal> _availablemeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  bool ismealfavorite (String id){
    return _favoriteMeals.any((meal) => meal.id == id);

  }

  void _tooglefavorites(String mealid) {
    final existingindex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealid);
    if (existingindex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingindex);
      });
    } else {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
    }
  }

  void _savefilters(Map<String, bool> _filterdata) {
    setState(() {
      _filters = _filterdata;

      _availablemeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten' == true && meal.isGlutenFree == false]) {
          return false;
        }
        if (_filters['lactose' == true && meal.isLactoseFree == false]) {
          return false;
        }
        if (_filters['vegan' == true && meal.isVegan == false]) {
          return false;
        }
        if (_filters['Vegetarian' == true && meal.isVegetarian == false]) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                title: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
              )),
      // home:CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        '/c': (context) => CategoriesScreen(),
        '//': (context) => CategoryMealsScreen(_availablemeals),
        '///': (context) => MealDetailScreen(_tooglefavorites,ismealfavorite),
        '////': (context) => FiltersScreen(_savefilters, _filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
