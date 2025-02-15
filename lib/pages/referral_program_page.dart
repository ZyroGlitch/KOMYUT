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
        title: Text('REFFERAL PROGRAM PAGE'),
      ),
      drawer: DrawerNavbar(),
      body: Center(
        child: Text('This is referral program page.'),
      ),
    );
  }
}
