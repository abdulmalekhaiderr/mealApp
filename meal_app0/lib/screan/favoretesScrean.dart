import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/mealitem.dart';

class Favoretesscrean extends StatelessWidget {
  List<Meal> fevoritesabeMeal;
  Favoretesscrean(this.fevoritesabeMeal);

  @override
  Widget build(BuildContext context) {
    if (fevoritesabeMeal.isEmpty){
      return Center(
        child: Text("you hava favorites yet - start adding some!"),
      );

    }
    else{
      return  ListView.builder(
        itemBuilder: (ctx, index) {
          return Mealitem(
            title: fevoritesabeMeal[index].title,
            imageUrl: fevoritesabeMeal[index].imageUrl,
            duration: fevoritesabeMeal[index].duration,
            complexity: fevoritesabeMeal[index].complexity,
            affordebility: fevoritesabeMeal[index].affordebility,
            id:fevoritesabeMeal[index].id,
          );
        },
        itemCount: fevoritesabeMeal.length,
      );

    }

  }}