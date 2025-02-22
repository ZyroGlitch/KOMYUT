import 'package:flutter/material.dart';

class ListtileDrawer extends StatefulWidget {
  const ListtileDrawer({
    super.key,
    required this.routeName,
    required this.destinationPage,
    required this.icon,
  });

  final String routeName;
  final VoidCallback destinationPage;
  final IconData icon;

  @override
  State<ListtileDrawer> createState() => _ListtileDrawerState();
}

class _ListtileDrawerState extends State<ListtileDrawer> {
  late bool listTile_hover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          listTile_hover = value;
        });
      },
      child: ListTile(
        leading: Icon(
          widget.icon,
          color: listTile_hover ? Colors.white : Colors.black,
        ),
        textColor: listTile_hover ? Colors.white : Colors.black,
        hoverColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(widget.routeName),
        onTap: widget.destinationPage,
      ),
    );
  }
}
