import 'package:flutter/material.dart';
import 'package:meal_app0/dummy_data.dart';

class MealDetailsScrean extends StatelessWidget {
Function toggleFavorites;
Function isMealFavorites;

  MealDetailsScrean(this.toggleFavorites,this.isMealFavorites);

  static const routesName = "meal_details";

  Widget containerText(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget containerbutton(Widget child) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealiD1 = ModalRoute.of(context)!.settings.arguments as String;
    final selectMeal = DUMMY_MEAL.firstWhere((meal) => meal.id == mealiD1);

    return Scaffold(
        appBar: AppBar(
          title: Text(selectMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    selectMeal.imageUrl,
                    fit: BoxFit.cover,
                  )),
              containerText(context, "Ingredient"),
              containerbutton(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          selectMeal.ingredients[index],
                        )),
                  ),
                  itemCount: selectMeal.ingredients.length,
                ),
              ),
              containerText(context, "stopes"),
              containerbutton(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("#${index + 1}"),
                      ),
                      title: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            selectMeal.steps[index],
                          )),
                    ),
                    Divider()
                  ]),
                  itemCount: selectMeal.steps.length,
                ),
              ),
            ],
          ),

        ),
    floatingActionButton: FloatingActionButton(onPressed:()=>toggleFavorites(mealiD1),
    child: Icon(isMealFavorites(mealiD1)? Icons.star:Icons.star_border ,)),
    );
  }
}
