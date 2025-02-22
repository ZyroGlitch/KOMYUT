import 'package:flutter/material.dart';
import 'package:komyut/components/listTile_drawer.dart';
import 'package:komyut/login_page.dart';
import 'package:komyut/pages/emergencyHotline_page.dart';
import 'package:komyut/pages/report_page.dart';
import 'package:komyut/pages/home_page.dart';
import 'package:komyut/pages/referral_program_page.dart';
import 'package:komyut/pages/subscription_page.dart';

class DrawerNavbar extends StatefulWidget {
  const DrawerNavbar({super.key});

  @override
  State<DrawerNavbar> createState() => _DrawerNavbarState();
}

class _DrawerNavbarState extends State<DrawerNavbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Center(
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListtileDrawer(
                  routeName: 'Home',
                  destinationPage: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  icon: Icons.explore,
                ),
                ListtileDrawer(
                  routeName: 'Report Issue',
                  destinationPage: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReportPage(),
                      ),
                    );
                  },
                  icon: Icons.support_agent,
                ),
                ListtileDrawer(
                  routeName: 'Emergency Hotline',
                  destinationPage: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EmergencyhotlinePage(),
                      ),
                    );
                  },
                  icon: Icons.contact_emergency,
                ),
                ListtileDrawer(
                  routeName: 'Subscription Plan',
                  destinationPage: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SubscriptionPage(),
                      ),
                    );
                  },
                  icon: Icons.subscriptions,
                ),
                ListtileDrawer(
                  routeName: 'Referral Program',
                  destinationPage: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReferralProgramPage(),
                      ),
                    );
                  },
                  icon: Icons.share,
                ),
              ],
            ),
            ListtileDrawer(
              routeName: 'Signout',
              destinationPage: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              icon: Icons.logout_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
