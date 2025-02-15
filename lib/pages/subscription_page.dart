import 'package:flutter/material.dart';
import 'package:komyut/components/drawer_navbar.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SUBSCRIPTION PAGE'),
      ),
      drawer: DrawerNavbar(),
      body: Center(
        child: Text('This is subscription page.'),
      ),
    );
  }
}
