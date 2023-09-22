import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DrawerThirdPage extends StatelessWidget {
  const DrawerThirdPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DrawerThirdPage01();
  }
}

class DrawerThirdPage01 extends StatefulWidget {
  const DrawerThirdPage01({super.key});

  @override
  State<DrawerThirdPage01> createState() => _DrawerThirdPage01State();
}

class _DrawerThirdPage01State extends State<DrawerThirdPage01> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: Text('Navigation bar Design'),
      ),
      body: Center(
        child: Text(
          'Page $_currentIndex',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          backgroundColor: Colors.orangeAccent,
          tabs: const [
            GButton(
              text: 'Favorites',
              icon: Icons.favorite,
            ),
            GButton(
              text: 'Music',
              icon: Icons.music_note,
            ),
            GButton(
              text: 'Places',
              icon: Icons.location_on,
            ),

            GButton(
              text: 'News',
              icon: Icons.library_books,
            ),
          ],
          selectedIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
