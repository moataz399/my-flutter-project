import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  final Function savefilters;
  final Map<String, bool> currentfilters;

  FiltersScreen(this.savefilters, this.currentfilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  initState() {
     _GlutenFree = widget.currentfilters['gluten'];

     _LactoseFree =  widget.currentfilters['lactose'];

     _Vegan =  widget.currentfilters['vegan'];

     _Vegetarian =  widget.currentfilters['Vegetarian'];
    super.initState();
  }

  bool _GlutenFree = false;

  bool _LactoseFree = false;

  bool _Vegan = false;

  bool _Vegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedfilter = {
                'gluten': _GlutenFree,
                'lactose': _LactoseFree,
                'vegan': _Vegan,
                'Vegetarian': _Vegetarian,
              };
              widget.savefilters(selectedfilter);
            },
          )
        ],
        title: Text('You Favorites'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
              // textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluten-free', 'only include gluten-free meals', _GlutenFree,
                  (newvalue) {
                setState(() {
                  _GlutenFree = newvalue;
                });
              }),
              buildSwitchListTile('_LactoseFree',
                  'only include _LactoseFreemeals', _LactoseFree, (newvalue) {
                setState(() {
                  _LactoseFree = newvalue;
                });
              }),
              buildSwitchListTile('_Vegan', 'only include_Vegan meals', _Vegan,
                  (newvalue) {
                setState(() {
                  _Vegan = newvalue;
                });
              }),
              buildSwitchListTile(
                  '_Vegetarian', 'only include _Vegetarian meals', _Vegetarian,
                  (newvalue) {
                setState(() {
                  _Vegetarian = newvalue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, String subtitle, bool currentval, Function updateval) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentval,
      onChanged: updateval,
    );
  }
}
