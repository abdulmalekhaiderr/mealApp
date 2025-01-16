import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screan/category_screan.dart';

import 'favoretesScrean.dart';
import '../widgets/main_drawer.dart';

class Tabsscrean extends StatefulWidget {
  List<Meal> fevoritesabeMeal;
   Tabsscrean(this.fevoritesabeMeal);

  @override
  State<Tabsscrean> createState() => _TabsscreanState();
}

class _TabsscreanState extends State<Tabsscrean> {
  List? page;


  int selectIndex=0;
  void _selectpage(int index) {
  setState(() {
    selectIndex=index;
  });
  }

  @override
  void initState() {
    page=[
      {'title':"category"
        ,
        'page':CategoryScrean(),
      },
      {'title':"favorites"
        ,
        'page':Favoretesscrean(widget.fevoritesabeMeal),
      }
    ];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tabsec"),
      ),
      body: page?[selectIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.pinkAccent,
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex:selectIndex ,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.category),
        label: "categortes"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),
        label: "favorites")
      ]),
      drawer:MainDrawer(),
    );
  }


}
