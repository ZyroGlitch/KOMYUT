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
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
          ],
        ),
      ),
      drawer: DrawerNavbar(),
      body: Center(
        child: Text('This is subscription page.'),
      ),
    );
  }
}
