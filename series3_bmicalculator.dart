
import 'package:flutter/material.dart';
import 'package:ritu_trainee/calculated_bmi.dart';
class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController weight_con = new TextEditingController();
  TextEditingController height_con = new TextEditingController();
  TextEditingController calcalated_bmi = new TextEditingController();
  
  Calculate_Bmi(){
    var my_weight=double.parse(weight_con.text);
    var my_height = double.parse(height_con.text);
    double BMI = (my_weight/(my_height*my_height));

    print(calcalated_bmi);
    setState(() {
      calcalated_bmi.text = BMI.toStringAsFixed(1);
      if(BMI<16){
        print('Severe Thinness');
      }
      else if(BMI>=16 && BMI<=17){
        print('Moderate');
      }
      else if(BMI>=17 && BMI<=18.5){
        print('Mild');
      }
      else if(BMI>=18.5 && BMI<=25){
        print('Normal');
      }
      else if(BMI>=25 && BMI<=30){
        print('OverWeight');
      }
      else if(BMI>=30 && BMI<=35){
        print('Obese I');
      }
      else if(BMI>=35 && BMI<=40){
        print('Obese II');
      }
      else if(BMI>40){
        print('Obese III');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: Text('BMI CALCULATOR',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(height: 100,),
          Center(child: Text('Calculated BMI',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[900]))),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child: TextField(
              controller: weight_con,
              style: TextStyle(fontSize: 15,color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your weight (kg)'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child: TextField(
              controller: height_con,
              style: TextStyle(fontSize: 15,color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your height (m)'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(child: Text('calculate',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=> calculate(bmiresult: calcalated_bmi.text)),);
              Calculate_Bmi();
            }),
          ),
      ],),
    );
  }
}
