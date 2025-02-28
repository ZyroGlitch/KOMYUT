import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    super.key,
    required this.description,
    required this.price,
  });

  final String description, price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Card.outlined(
          color: Colors.orange[400],
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
