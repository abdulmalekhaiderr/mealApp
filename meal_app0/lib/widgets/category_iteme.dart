
import 'package:flutter/material.dart';
import 'package:meal_app0/screan/category_meals_screan.dart';

class CategoryIteme extends StatelessWidget {
  final String id ;
  final String title;
  Color? color;
   CategoryIteme({super.key, required this.id, required this.title,this.color});

   void selectCategory(BuildContext co){
     Navigator.of(co).pushNamed(CategoryMealsScrean.routesName,
     arguments: {
       "Id":id,
       "title":title
     }
     );
   }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
     onTap: ()=>selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
       child:  Text(title, style:Theme.of(context).textTheme.titleLarge ,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                color!.withOpacity(0.3),
            color!,

          ],
              begin: Alignment.topLeft,
          end: Alignment.bottomRight),
            // color: color,
            borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
