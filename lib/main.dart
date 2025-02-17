import 'package:flutter/material.dart';
import 'package:komyut/landing.dart';
import 'package:komyut/pages/home_page.dart';
import 'package:komyut/route_content.dart';

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
      home: RouteContent(),
    );
  }
}
