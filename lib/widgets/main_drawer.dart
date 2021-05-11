import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Text(
              'Cooking up !',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: 20),
          buildListTile('Meal',Icons.restaurant,(){Navigator.pushNamed(context, '/');}),
          buildListTile('Filters', Icons.settings,(){Navigator.pushNamed(context, '////');})
        ],
      ),
    );
  }

  ListTile buildListTile(String title,IconData icon,Function tabhandler ) {

    return ListTile(
      onTap: tabhandler,
          leading: Icon(
            icon,
            size: 26,
          ),
          title: Text(
            title,
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold),
          ),
        );
  }
}
