import 'package:flutter/material.dart';
import 'input_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0c1135),
        scaffoldBackgroundColor: Color(0xFF0c1135),
      ),
      home: InputPage(),
    );
  }
}


