import 'package:brand_store_app/screens/cart.dart';
import 'package:brand_store_app/screens/home.dart';
import 'package:brand_store_app/screens/search_screen.dart';
import 'package:brand_store_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [Home(), SearchScreen(), Cart(), SettingsScreen()],
      ),
    );
  }
}
