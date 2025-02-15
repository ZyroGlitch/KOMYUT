import 'package:flutter/material.dart';
import 'package:komyut/components/drawer_navbar.dart';
import 'package:komyut/login_page.dart';
import 'package:komyut/pages/explore_page.dart';
import 'package:komyut/pages/subscription_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME PAGE'),
      ),
      drawer: DrawerNavbar(),
      body: Center(
        child: Text('This is homepage.'),
      ),
    );
  }
}
