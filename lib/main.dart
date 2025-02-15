import 'package:flutter/material.dart';
import 'package:komyut/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KOMYUT',
      debugShowCheckedModeBanner: false,
      home: Landing(),
    );
  }
}
