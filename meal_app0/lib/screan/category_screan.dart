import 'package:flutter/material.dart';
import '../widgets/category_iteme.dart';
import '../dummy_data.dart';

class CategoryScrean extends StatelessWidget {
   CategoryScrean();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: GridView(
          children: DUMMY_CATEGORIES
              .map((catdata) => CategoryIteme(
                    id: catdata.id,
                    title: catdata.title,
                    color: catdata.color,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

            maxCrossAxisExtent: 300,
          crossAxisSpacing: 20,
            childAspectRatio: 3/2,
            mainAxisSpacing: 20,

          )

      ),
    );
  }
}
