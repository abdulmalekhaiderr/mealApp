import 'package:flutter/material.dart';
import 'package:meal_app0/widgets/filter.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildtitle( String text,IconData icon ,  tapshander){
    return  ListTile(

      title: Text(text ,style: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.bold
      ),),
      leading: Icon(icon),
      onTap: tapshander,

    );


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Text(
              "Cookes up",

              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'RobotoCondensed'
              ),
            )),
        buildtitle("meal", Icons.restaurant, (){
          Navigator.of(context).pushNamed('/');
        }),
        buildtitle("filter", Icons.settings,(){
          Navigator.of(context).pushNamed(Filter.routeName);
        } )


      ],
    );
  }
}
