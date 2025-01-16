import 'package:flutter/material.dart';
import 'package:meal_app0/dummy_data.dart';
import 'package:meal_app0/widgets/filter.dart';
import '../screan/tabsscrean.dart';
import './screan/category_meals_screan.dart';
import '../screan/category_screan.dart';
import './screan/meal_details_screan.dart';
import 'models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availabeMeal = DUMMY_MEAL.cast<Meal>();
  List<Meal> _fevoritesabeMeal = [];

  void toggleFavorites( String mealId){
  final exstringIdex= _fevoritesabeMeal.indexWhere((meal)=>meal.id==mealId);
    if(exstringIdex>=0){
      setState(() {
        _fevoritesabeMeal.removeAt(exstringIdex);
      });

    }
    else{
      setState(() {
        _fevoritesabeMeal.add(DUMMY_MEAL.firstWhere((meal)=>meal.id==mealId));
      });
    }

  }
  bool isMealFavorites(String id){
    return _fevoritesabeMeal.any((meal)=>meal.id==id);
  }
  void _selectfiler(Map<String, bool> _filtersId) {
    setState(() {
      _filters = _filtersId;
      _availabeMeal = DUMMY_MEAL
          .where((meal) {
            if (_filters['gluten'] == true && meal.isGlutenFree == false) {
              return false;
            }
            if (_filters['lactose'] == true && meal.isLactoseFree == false) {
              return false;
            }
            if (_filters['vegan'] == true && meal.isVegan == false) {
              return false;
            }
            if (_filters['vegetarian'] == true && meal.isVegetarian == false) {
              return false;
            }
            return true;
          })
          .cast<Meal>()
          .toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 0),
        primarySwatch: Colors.pink,
        primaryColor: Colors.amber,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            bodyMedium: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            titleLarge: TextStyle(fontSize: 24, fontFamily: "RobotoCondensed")),
        useMaterial3: true,
      ),
      // home:  MyHomePage(),
      // home: CategoryScrean(),
      routes: {
        '/': (context) => Tabsscrean(_fevoritesabeMeal ),
        CategoryMealsScrean.routesName: (context) => CategoryMealsScrean(_availabeMeal),
        MealDetailsScrean.routesName: (context) => MealDetailsScrean(toggleFavorites,isMealFavorites),
        Filter.routeName: (context) => Filter(_selectfiler ,_filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("meal App"),
        ),
        body: CategoryScrean());
  }
}
