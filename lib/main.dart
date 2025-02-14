import 'package:flutter/material.dart';
import 'package:komyut/components/drawer_navigation.dart';
import 'package:komyut/dashboard.dart';
import 'package:komyut/landing.dart';
import 'package:komyut/landing_page.dart';
import 'package:komyut/login_page.dart';
import 'package:komyut/register_page.dart';

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
      home: DrawerNavigation(),
    );
  }
}
