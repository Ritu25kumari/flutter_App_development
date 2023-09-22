import 'package:flutter/material.dart';
import 'package:ritu_trainee/series1_ImagePicker.dart';
import 'package:ritu_trainee/series2_DateTimePicker.dart';
import 'package:ritu_trainee/series3_bmicalculator.dart';
import 'package:ritu_trainee/series6_updateImage.dart';
import 'package:ritu_trainee/series7.1_drawerconcept.dart';
import 'package:ritu_trainee/series8_navigationbar.dart';
class FirstProject extends StatefulWidget {
  @override
  State<FirstProject> createState() => _FirstProjectState();
}
class _FirstProjectState extends State<FirstProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Page',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.teal[900],
        ),
        body:Center(
          child: Container(
            color: Colors.teal[700],
            height: 350, width: 250,
            child: Column(
              children: [
                ElevatedButton(child: const Text('ImagePicker',style: TextStyle(color: Colors.black),),
                  onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=> ImagePickerApp())),),
                ElevatedButton(child: const Text('Date&Time Picker',style: TextStyle(color: Colors.black),),
                  onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const TimeDatePicker())),),
                ElevatedButton(child: const Text('BMI Calculator',style: TextStyle(color: Colors.black),),
                  onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const BmiCalculator())),),
                // ElevatedButton(child: const Text('Image Grid View',style: TextStyle(color: Colors.black),),
                // onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>GridExample())),),
                // ElevatedButton(child: const Text('PostModel',style: TextStyle(color: Colors.black),),
                // onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PostImage())),),
                // ElevatedButton( child: Text('new post model'),
                // onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>GridImage())),),
                // ElevatedButton(child: Text('VibeTalk'),
                // onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageSelectionScreen())),),
                // ElevatedButton(child: Text('Edit Images'),
                // onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>EditImage())),),
                ElevatedButton(child: const Text('Update Image',style: TextStyle(color: Colors.black),),
                  onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpdateImage())),),
                ElevatedButton(child: const Text('Drawer Concept',style: TextStyle(color: Colors.black),),
                  onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>DrawerConcept())),),
                ElevatedButton( child: const Text('Navigation Bar Concept',style: TextStyle(color: Colors.black),),
                  onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>NavigationBarConcept())),)
              ],
            ),
          ),
        )
    );
  }
}
