import 'package:flutter/material.dart';
import 'package:komyut/components/drawer_navbar.dart';

class ReferralProgramPage extends StatefulWidget {
  const ReferralProgramPage({super.key});

  @override
  State<ReferralProgramPage> createState() => _ReferralProgramPageState();
}

class _ReferralProgramPageState extends State<ReferralProgramPage> {
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
        child: Text('This is referral program page.'),
      ),
    );
  }
}
