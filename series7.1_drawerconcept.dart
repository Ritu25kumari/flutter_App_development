import 'package:flutter/material.dart';
import 'package:ritu_trainee/series7.2_firstpage.dart';
import 'package:ritu_trainee/series7.3_secondpage.dart';
import 'package:ritu_trainee/series7.4_thirdpage.dart';
import 'package:ritu_trainee/series7.5_fourthpage.dart';
class DrawerConcept extends StatefulWidget {
  const DrawerConcept({super.key});

  @override
  State<DrawerConcept> createState() => _DrawerConceptState();
}

class _DrawerConceptState extends State<DrawerConcept> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.grey,
       title: Text('Flutter Drawer Example',style: TextStyle(fontWeight: FontWeight.bold),),
     ),
     drawer: Drawer(
         child: ListView(
             children: [
         DrawerHeader(
         decoration: BoxDecoration(
           color: Colors.blueGrey,
         image: DecorationImage(
             image: NetworkImage(
               'https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU'
             ),         fit: BoxFit.cover),
   ), child: null,
           ),
           // UserAccountsDrawerHeader(
           //   decoration: BoxDecoration(
           //     image: DecorationImage(image: NetworkImage('https://play-lh.googleusercontent.com/soalDoWAUfKuxbGJqJ7IB9u1BvGFlPXKxZDYwXkncyYAK6K1WglONxK1kfzB6Xjib2c=s200'))
           //   ),
           //   accountName: Text('Ritu'), accountEmail: Text('ritu2708@gmail.com'),
           //   currentAccountPicture: CircleAvatar(
           //   child:Text('R')
           // ),
           // ),
           ListTile(
             title: Text('1.Page No'),
             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>DrawerFirstPage())),
           ),
           ListTile(
             title: Text('2.Page No'),
             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DrawerSecondPage())),
           ),
           ListTile(
             title: Text('3.Page No'),
             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DrawerThirdPage())),
           ),
           ListTile(
             title: Text('4.Page No'),
             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DrawerFourthPage())),
           )
         ],

       ),
     ),
   );
  }
}

