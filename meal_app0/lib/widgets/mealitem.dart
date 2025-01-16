import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screan/meal_details_screan.dart';

class Mealitem extends StatelessWidget {
  final String title;

  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordebility affordebility;
  final String id;

  Mealitem({
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordebility,
    required this.id,


  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "unknown";
    }
  }

  String get affordebilitytext {
    switch (affordebility) {
      case Affordebility.Affordeble:
        return "Affordeble";
        break;
      case Affordebility.Pricey:
        return "Pricey";
        break;

      case Affordebility.Luxurions:
        return "Luxurions";
        break;
      default:
        return "unknown";
    }
  }

  selectItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScrean.routesName,
      arguments:id,



    ).then((result1){
      if(result1 !=null){
      //   removeitems(result1);
      // print(result1);
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap:()=> selectItem(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      "$title",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text("$duration min"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 5,
                    ),
                    Text("$complexityText "),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 5,
                    ),
                    Text("$affordebilitytext"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
