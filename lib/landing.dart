import 'package:flutter/material.dart';
import 'package:komyut/login_page.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        child: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.4,
                  child: Image.asset(
                    'images/background.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/komyut_logo.png',
                      width: 230,
                      height: 230,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    Text(
                      'Your Guide to Every Ride!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 26),
                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      label: Text(
                        'Find Your Route',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5,
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_right_alt_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                      iconAlignment: IconAlignment.end,
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(300, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
