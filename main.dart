import 'package:flutter/material.dart';
import 'package:ritu_trainee/flutterfirstpro.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage1(),
    );
  }
}
class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key});

  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}
class _MyHomePage1State extends State<MyHomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Center(child: Text('Flutter Project',style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: ElevatedButton(child: Text('First Project'),
      onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstProject())),),
    );
  }
}
