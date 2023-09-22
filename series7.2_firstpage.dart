import 'package:flutter/material.dart';
class DrawerFirstPage extends StatelessWidget {
  const DrawerFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey,
          title: Text('First Page'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat),),
              Tab(icon: Icon(Icons.search),),
              Tab(icon: Icon(Icons.settings),)
            ],
            //dividerColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Chats',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            Center(child: Text('Search',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            Center(child: Text('Setting',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
          ],
        )
      ),
    );
  }
}
