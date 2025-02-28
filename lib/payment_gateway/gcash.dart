import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Gcash extends StatefulWidget {
  const Gcash({super.key});

  @override
  State<Gcash> createState() => _GcashState();
}

class _GcashState extends State<Gcash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 27, 61, 255),
        title: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
          label: Text(
            'Gcash Pay Bills',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: 18),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsetsDirectional.zero,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Colors.lightBlue,
                  child: Column(
                    children: [
                      Text(
                        'Standard Plan',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Confirmation',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'You are about to pay',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'php 150.00',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'using your GCash',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Account Number (11-Digits)',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '09615607681',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Gcash Name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Account Name',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'David Aguilar',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      // Email
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'david@gmail.com',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Text(
                        'Please note that several billers charge a service fee.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Confirm Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          title: 'Your GCash Transaction is Complete.',
                        ).then(
                          (value) => Navigator.pop(context),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          foregroundColor: Colors.white,
                          fixedSize: Size(500, 50),
                          textStyle: TextStyle(fontSize: 18)),
                      child: Text('CONFIRM'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
