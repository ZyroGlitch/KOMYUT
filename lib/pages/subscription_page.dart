import 'package:flutter/material.dart';
import 'package:komyut/components/drawer_navbar.dart';
import 'package:komyut/components/perks.dart';
import 'package:komyut/components/subscription_card.dart';

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
        iconTheme: IconThemeData(
          color: Colors.black, // Change the drawer icon color to grey
        ),
        backgroundColor: Color(0xFFf5fffd),
        shadowColor: Colors.grey,
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  'images/subscription_logo.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                Text(
                  'Upgrade to Premium',
                  style: TextStyle(
                    color: Color(0xFF021d18),
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Get unlimited route suggestions, real-time updates, pinpoint multiple landmarks, and much more!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubscriptionCard(
                      description: 'Free',
                      price: '₱0.00',
                      status: true,
                    ),
                    SubscriptionCard(
                      description: 'Standard',
                      price: '₱500.00 / month',
                      status: false,
                    ),
                    SubscriptionCard(
                      description: 'Premium',
                      price: '₱1000.00 / month',
                      status: false,
                    ),
                  ],
                ),
                SizedBox(height: 26),
                Column(
                  children: [
                    Perks(content: 'Unlimited route suggestions.'),
                    SizedBox(height: 8),
                    Perks(content: 'Unlimited route suggestions.'),
                    SizedBox(height: 8),
                    Perks(content: 'Unlimited route suggestions.'),
                    SizedBox(height: 8),
                  ],
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Color(0xFF82d6f8),
                    foregroundColor: Colors.black,
                    fixedSize: Size(1000, 45),
                  ),
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontSize: 18,
                    ),
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
