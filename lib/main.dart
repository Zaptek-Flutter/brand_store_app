import 'package:brand_store_app/screens/cart.dart';
import 'package:brand_store_app/screens/checkout.dart';
import 'package:brand_store_app/screens/details.dart';
import 'package:brand_store_app/screens/home.dart';
import 'package:brand_store_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

import 'data/shirt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Brand Store App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
          useMaterial3: true,
        ),
        home: const MainScreen());
  }
}
