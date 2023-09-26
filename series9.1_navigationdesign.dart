import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ritu_trainee/series9.2_navigationdesign.dart';
import 'package:ritu_trainee/series9.3_Grocerysearchpage.dart';
import 'package:ritu_trainee/series9.4_Grocerycartpage.dart';
import 'package:ritu_trainee/series9.5_profilepage.dart';


class Grocerystore extends StatefulWidget {
  @override
  _GrocerystoreState createState() => _GrocerystoreState();
}

class _GrocerystoreState extends State<Grocerystore> {
  int _currentIndex = 0;
  List<Widget> _listbottom =<Widget>[
    Grocerystore1(),
    SearchPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Laundry Application'),
        ),
        body:_listbottom.elementAt(_currentIndex),

        bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.shopping_cart, size: 30),
            Icon(Icons.person, size: 30),
          ],
          color: Colors.transparent, // Make the background transparent
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            }
            );
          },
        ),
      ),
    );
  }
}