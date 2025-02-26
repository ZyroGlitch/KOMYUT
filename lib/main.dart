import 'package:flutter/material.dart';
import 'package:komyut/landing.dart';
import 'package:komyut/landing_page.dart';
import 'package:komyut/login_page.dart';
import 'package:komyut/pages/emergencyHotline_page.dart';
import 'package:komyut/pages/home_page.dart';
import 'package:komyut/pages/profile_page.dart';
import 'package:komyut/pages/referral_program_page.dart';
import 'package:komyut/pages/report_page.dart';
import 'package:komyut/pages/subscription_page.dart';
import 'package:komyut/payment_gateway/gcash.dart';
import 'package:komyut/profilePage_section/edit_page.dart';
import 'package:komyut/report_issue_page/add_report.dart';
import 'package:komyut/report_issue_page/view_report.dart';
import 'package:komyut/route_page/googleMap_screen.dart';
import 'package:komyut/route_page/polyLines.dart';

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
      home: GooglemapScreen(),
    );
  }
}
