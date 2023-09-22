import 'package:flutter/material.dart';
import 'package:ritu_trainee/series7.2_firstpage.dart';
import 'package:ritu_trainee/series7.3_secondpage.dart';
import 'package:ritu_trainee/series7.4_thirdpage.dart';

class NavigationBarConcept extends StatefulWidget {
  const NavigationBarConcept({super.key});
  @override
  State<NavigationBarConcept> createState() => _NavigationBarConceptState();
}

class _NavigationBarConceptState extends State<NavigationBarConcept> {
  int _bar = 0;
  final List<Widget> _barlist = <Widget>[
     DrawerFirstPage(),
     DrawerSecondPage(),
     DrawerThirdPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Navigation Bar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.cyan,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home',),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'message'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'call')
        ],
        onTap: (index) {
          setState(() {
            _bar = index;
          });
        },
      ),
      body: _barlist.elementAt(_bar),
    );
  }
}
