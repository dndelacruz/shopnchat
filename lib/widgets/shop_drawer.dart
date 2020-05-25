import 'package:flutter/material.dart';

import './drawer_item.dart';

class ShopDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up',
              style: TextStyle(
                
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),     
            ),
          ),
          SizedBox(height: 20,),
          DrawerItem(title: 'Meals', icon: Icons.restaurant, tapHandler: () => Navigator.of(context).pushReplacementNamed('/')),
          DrawerItem(title: 'Settings', icon: Icons.settings, tapHandler: () => Navigator.of(context).pushReplacementNamed('/filters'),),
        ],
      ),
    );
  }
}