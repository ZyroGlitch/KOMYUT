import 'package:flutter/material.dart';

class EmailCard extends StatefulWidget {
  EmailCard({super.key});

  Color cardColor = Colors.white;
  Color contentColor = Colors.black;

  @override
  State<EmailCard> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          widget.cardColor = value ? Colors.cyan : Colors.white;
          widget.contentColor = value ? Colors.white : Colors.black;
        });
      },
      child: Card(
        margin: EdgeInsetsDirectional.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.zero,
        ),
        color: widget.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: widget.contentColor,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Road Accident',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: widget.contentColor,
                        ),
                      ),
                      Text(
                        'Feb 22, 2025 - 3:30PM',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: widget.contentColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '10 mins ago',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: widget.contentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
