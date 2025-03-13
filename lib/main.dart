import 'package:flutter/material.dart';
import 'package:komyut/landing.dart';
import 'package:komyut/pages/home_page.dart';
import 'package:komyut/pages/redeemPoints_page.dart';
import 'package:komyut/profilePage_section/edit_page.dart';
import 'package:komyut/report_issue_page/view_report.dart';
import 'package:komyut/route_page/googleMap_screen.dart';
import 'package:komyut/route_page/route_content.dart';

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
