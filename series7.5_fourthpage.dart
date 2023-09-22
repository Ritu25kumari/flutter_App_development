import 'package:flutter/material.dart';
class DrawerFourthPage extends StatelessWidget {
  const DrawerFourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text('Fourth Page'),
      ),
      body:Text('This is my fourth page.') ,
    );
  }
}
