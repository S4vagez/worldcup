import 'package:flutter/material.dart';
import 'package:flutter_food_20221016/pages/counter/counter_page.dart';
import 'package:flutter_food_20221016/pages/food_list/food_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Cup 2022',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FoodListPage(),
    );
  }
}
