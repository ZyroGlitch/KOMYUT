import 'package:flutter/material.dart';
import 'package:komyut/components/drawer_navbar.dart';

import 'profile_page.dart';

class ReferralProgramPage extends StatefulWidget {
  const ReferralProgramPage({super.key});

  @override
  State<ReferralProgramPage> createState() => _ReferralProgramPageState();
}

class _ReferralProgramPageState extends State<ReferralProgramPage> {
  static bool customIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerNavbar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Refer your friends \nand Earn',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Image.asset(
                  'images/gift.png',
                  width: 130,
                  height: 130,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10),
                Text(
                  '100 \nLoyal Points',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Your friend gets 100 loyal points on sign up\n and you get 100 loyal points too everytime!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Card.outlined(
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        Text(
                          'Your referral code',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ABCDG123',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text('Copy code'),
                  icon: Icon(Icons.copy),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 40),
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Share your Referral Code via',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: Text('Facebook'),
                        icon: Icon(Icons.facebook),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 40),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/instagram.png',
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Text('Instagram'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 40),
                          backgroundColor: Color.fromARGB(255, 255, 93, 93),
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'Frequently Asked Questions',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ExpansionTile(
                        title: Text(
                          'What is refer and earn program?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          customIcon
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Refer your friends and earn 100 loyal points on every successful referral.',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                        onExpansionChanged: (bool expand) {
                          setState(() {
                            customIcon = expand;
                          });
                        },
                      ),
                      ExpansionTile(
                        title: Text(
                          'How it works?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          customIcon
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 10,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Share your unique referral link with friends.',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                        onExpansionChanged: (bool expand) {
                          setState(() {
                            customIcon = expand;
                          });
                        },
                      ),
                      ExpansionTile(
                        title: Text(
                          'Where can I use this loyalty points?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          customIcon
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 10,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'You can convert your loyalty points into coupons, which can be used to get discounts on any subscription plan. Simply redeem your points, apply the coupon at checkout, and enjoy savings on your next subscription.',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                        onExpansionChanged: (bool expand) {
                          setState(() {
                            customIcon = expand;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
