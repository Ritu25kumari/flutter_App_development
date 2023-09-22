import 'package:flutter/material.dart';
import 'package:ritu_trainee/series8.1_page01.dart';
import 'package:ritu_trainee/series8.2_page02.dart';
import 'package:ritu_trainee/series8.3_page03.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
class DrawerSecondPage extends StatelessWidget {
  final _pageControlller = PageController();
  @override
  void dispose() {
    _pageControlller.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey,
          title: Text('second page'),
      ),
      body: //Text('hello'),
    PageView(
        controller: _pageControlller,
        children: [
          PageOne(),
          PageTwo(),
          PageThree()
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        color: const Color.fromARGB(255, 255, 240, 219),
        controller: _pageControlller,
        flat: true,
        useActiveColorByDefault: false,
        items: const [
          RollingBottomBarItem(Icons.home,
              label: 'Home', activeColor: Colors.redAccent),
          RollingBottomBarItem(Icons.camera,
              label: 'Camera', activeColor: Colors.blueAccent),
          RollingBottomBarItem(Icons.person,
              label: 'Person', activeColor: Colors.green),
        ],
        enableIconRotation: true,
        onTap: (index) {
          _pageControlller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}
