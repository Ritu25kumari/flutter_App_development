import 'package:flutter/material.dart';
import 'package:ritu_trainee/like_button.dart';
import 'package:ritu_trainee/series1_ImagePicker.dart';
import 'package:ritu_trainee/series2_DateTimePicker.dart';
import 'package:ritu_trainee/series3_bmicalculator.dart';
import 'package:ritu_trainee/series4_imageGridview.dart';
import 'package:ritu_trainee/series4_imagegrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body:Center(
        child: Container(
          color: Colors.deepPurple[400],
          height: 300,
          width: 250,
          child: Column(
            children: [
              ElevatedButton(child: Text('ImagePicker'),
              onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=> ImagePickerApp())),),
              ElevatedButton(child: Text('Date&Time Picker'),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>TimeDatePicker())),),
              ElevatedButton(child: Text('BMI Calculator'),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiCalculator())),),
              ElevatedButton(child: Text('Image Grid View'),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>GridExample())),),
              ElevatedButton(child: Text('PostModel'),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PostImage())),),
              ElevatedButton( child: Text('new post model'),
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>gridImage())),)
            ],
          ),
        ),
      )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
