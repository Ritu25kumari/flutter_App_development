import 'package:flutter/material.dart';

class calculate extends StatelessWidget {
 final bmiresult;
 calculate({this.bmiresult});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      backgroundColor: Colors.blue[900],
        title: Text('Calculated BMI',style: TextStyle(fontSize: 20,color: Colors.white),),
      ),

      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text('BMI Calculated',style: TextStyle(fontSize: 18,color: Colors.blue),),
              Text(bmiresult,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue[900]),),
            ],
          ),
        ),
      ),
    );
  }
}