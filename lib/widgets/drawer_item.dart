import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DrawerItem extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function tapHandler;

  DrawerItem({@required this.title, @required this.icon, @required this.tapHandler});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(title, style: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),),
      onTap: tapHandler,
    );
  }
}