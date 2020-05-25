import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './sell_main.dart';
import './shop_main.dart';
import '../widgets/shop_drawer.dart';
import '../widgets/sell_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPage = 0;
  @override
  void initState() {
    // TODO: implement initState

    _pages = [
    {'page': ShopScreen(), 'title': 'Categories', 'drawer': ShopDrawer()},
    {'page': SellScreen(), 'title': 'Favorites', 'drawer': SellDrawer()}
  ];
    
    super.initState();
  }

  void _selectPage(int index) {
    setState(() => _selectedPage = index);
    // print(_pages[_selectedPage]['title']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopM@te'),
        actions: <Widget>[DropdownButton(
          underline: Container(),
          icon: Icon(Icons.more_vert, color: Theme.of(context).primaryIconTheme.color,),
          items: [
            DropdownMenuItem(
              child: Container(child: Row(children: <Widget>[
                Icon(Icons.exit_to_app),
                SizedBox(width: 8,),
                Text('Logout'),
              ],),),
              value: 'logout',
            ),
          ],
           onChanged: (selectedValue) {
             if(selectedValue == 'logout') FirebaseAuth.instance.signOut();
           }
           )],
      ),
      drawer: _pages[_selectedPage]['drawer'],
      
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.shopping_cart),
            title: Text('Shop'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.shop),
            title: Text('Sell'),
          )
        ],
      ),
    );
  }
}
