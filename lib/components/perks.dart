import 'package:flutter/material.dart';

class Perks extends StatelessWidget {
  const Perks({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 12,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          ),
        ),
        SizedBox(width: 12),
        Text(
          content,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF021d18),
          ),
        ),
      ],
    );
  }
}
