import 'package:flutter/material.dart';
import 'package:sec2/BMI/bmiScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BMIScreen(),
    );
  }
}
