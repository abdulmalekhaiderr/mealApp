
import 'package:flutter/material.dart';

class CategoryIteme extends StatelessWidget {
  final String id ;
  final String title;
  Color? color;
   CategoryIteme({super.key, required this.id, required this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: (){},
      child: Container(
        padding: EdgeInsets.all(15),
       child:  Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                color!.withOpacity(0.5),
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
