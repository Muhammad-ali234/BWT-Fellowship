import 'package:animation/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          drawerTheme: const DrawerThemeData(scrimColor: Colors.transparent)),
      title: 'New Wathsapp UI',
      home: MyHomePage(),
    );
  }
}

