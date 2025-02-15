import 'package:flutter/material.dart';
import 'package:komyut/login_page.dart';
import 'package:komyut/pages/explore_page.dart';
import 'package:komyut/pages/home_page.dart';
import 'package:komyut/pages/referral_program_page.dart';
import 'package:komyut/pages/subscription_page.dart';

class DrawerNavbar extends StatelessWidget {
  const DrawerNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
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
                ListTile(
                  leading: Icon(Icons.home, color: Colors.black),
                  textColor: Colors.black,
                  hoverColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                    // QuickAlert.show(
                    //   context: context,
                    //   type: QuickAlertType.success,
                    //   text: 'Home ListTile gained focus.',
                    //   autoCloseDuration: const Duration(seconds: 5),
                    //   showConfirmBtn: true,
                    // );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.explore, color: Colors.black),
                  textColor: Colors.black,
                  hoverColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text('Explore'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ExplorePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.subscriptions, color: Colors.black),
                  textColor: Colors.black,
                  hoverColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text('Subscription Plan'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SubscriptionPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.share, color: Colors.black),
                  textColor: Colors.black,
                  hoverColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text('Referral Program'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ReferralProgramPage(), // Update this line
                      ),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded, color: Colors.black),
              textColor: Colors.black,
              hoverColor: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Text('Signout'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
