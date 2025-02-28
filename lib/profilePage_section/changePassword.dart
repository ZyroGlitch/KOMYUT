import 'package:flutter/material.dart';
import 'package:komyut/profilePage_section/verification.dart';

class Changepassword extends StatelessWidget {
  const Changepassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(
            'Back',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          icon: Icon(Icons.arrow_back, color: Colors.orange),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/forgot.png',
                width: 350,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 26),
            Text(
              'Forgot\nPassword?',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "We've sent a 4-digit code to your email. Use it to reset your password securely.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Verification(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Continue'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
