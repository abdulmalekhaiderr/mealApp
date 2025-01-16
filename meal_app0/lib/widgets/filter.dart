import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app0/widgets/main_drawer.dart';

class Filter extends StatefulWidget {
  Function selectFlites;
  Map<String, bool>currentfilter;

  Filter(this.selectFlites, this.currentfilter);

  static const routeName = "/filter";

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _gluten_Free = false;
  bool _lactose_Free = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _gluten_Free = widget.currentfilter['gluten']!;
    _lactose_Free = widget.currentfilter['lactose']!;
    _vegan = widget.currentfilter['vegan']!;
    _vegetarian = widget.currentfilter['vegetarian']!;
    super.initState();
  }

  Widget buildSwitchList(String title, String subtitle, bool current, onchang) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(subtitle),
      value: current,
      onChanged: onchang,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> _filters = {
                  'gluten': _gluten_Free,
                  'lactose': _lactose_Free,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.selectFlites(_filters);
              },
              icon: Icon(Icons.save))
        ],
        title: Text("your filter"),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Text("adjust your meal selection"),
        ),
        Expanded(
            child: ListView(
          children: [
            buildSwitchList(
                "Gluten Free", "only enclud gluten free meals ", _gluten_Free,
                (newValue) {
              setState(() {
                _gluten_Free = newValue;
              });
            }),
            buildSwitchList(
                "Lactose Free", "only enclud lactoseFree meals ", _lactose_Free,
                (newValue) {
              setState(() {
                _lactose_Free = newValue;
              });
            }),
            buildSwitchList("Vegan", "only enclud vegan meals ", _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
            buildSwitchList(
                "Vegetarian", "only enclud vegetarian meals ", _vegetarian,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
          ],
        ))
      ]),
      drawer: MainDrawer(),
    );
  }
}
