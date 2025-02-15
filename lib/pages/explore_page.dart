import 'package:flutter/material.dart';
import 'package:komyut/components/drawer_navbar.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EXPLORE PAGE'),
      ),
      drawer: DrawerNavbar(),
      body: Center(
        child: Text('This is explore page.'),
      ),
    );
  }
}
