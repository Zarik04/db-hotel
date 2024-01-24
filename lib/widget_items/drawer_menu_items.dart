import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String? itemName;
  final IconData? iconName;
  final Widget routeToPage;

  const DrawerItem({
    super.key,
    required this.itemName,
    required this.iconName,
    required this.routeToPage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        itemName!,
        style: TextStyle(
          color: Colors.green[500],
          fontWeight: FontWeight.w800,
          fontSize: 16.0,
        ),
      ),
      leading: Icon(
        iconName!,
        color: Colors.green,
        size: 30.0,
      ),
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => routeToPage),
        );
      },
    );
  }
}
