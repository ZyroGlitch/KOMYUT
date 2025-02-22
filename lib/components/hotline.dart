import 'package:flutter/material.dart';

class Hotline extends StatelessWidget {
  const Hotline({
    super.key,
    required this.backgroundColor,
    required this.hotline,
    required this.number,
    required this.image,
  });

  final Color backgroundColor;
  final String hotline, number, image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Text(
                  '$hotline \n$number',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
