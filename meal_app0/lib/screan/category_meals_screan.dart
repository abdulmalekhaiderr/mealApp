import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/mealitem.dart';



class CategoryMealsScrean extends StatefulWidget {
  List<Meal> availabeMeal;
  
  CategoryMealsScrean(this.availabeMeal );

  static const routesName = "category_meals";

  @override
  State<CategoryMealsScrean> createState() => _CategoryMealsScreanState();
}

class _CategoryMealsScreanState extends State<CategoryMealsScrean> {
  String? categotyId;
  String? categotyTitle;
  late List displayedMeal;

  @override
  void didChangeDependencies() {
    final routesgr =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categotyId= routesgr["Id"];
    categotyTitle= routesgr["title"];
    displayedMeal =widget.availabeMeal.where((meal) {
      return meal.categories.contains(categotyId);
    }).toList();
    super.didChangeDependencies();
  }

void _removeMeal(String itemID){
  setState(() {

   displayedMeal.removeWhere((meal1) {
      print("meal1.id= ${meal1.id} itemId= ${itemID}");
      return meal1.id ==itemID  ;
    });

  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categotyTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Mealitem(
            title: displayedMeal[index].title,
            imageUrl: displayedMeal[index].imageUrl,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordebility: displayedMeal[index].affordebility,
            id:displayedMeal[index].id,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
