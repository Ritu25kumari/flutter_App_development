import 'package:flutter/material.dart';
class TimeDatePicker extends StatefulWidget {

  const TimeDatePicker({super.key});

  @override
  TimeDatePickerState createState() => TimeDatePickerState();
}
class TimeDatePickerState extends State<TimeDatePicker> {
  late Future<DateTime?> selectedDate;
  String date = "--";

  late Future<TimeOfDay?> selectedTime;
  String time = "--";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Date&Time Picker Application',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Container(
          height: 400,width:300,color: Colors.cyan,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('DATE&TIME PICKER',
                style: TextStyle(fontSize:20),
              ),
              SizedBox(height: 20,),
              ElevatedButton(

                onPressed: () async {
                  DateTime? datepicked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050));
                  setState(() {
                    if(datepicked!=null){
                      date = '${datepicked.day}-${datepicked.month}-${datepicked.year}';
                      //print('Selected Date : ${datepicked.day}:${datepicked.month}:${datepicked.year}');
                    }
                    else{
                      date = '__-__-__';
                    }
                  });
                },
                child: Text('Select Date'),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size.fromHeight(100),
                  ),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.dial);
                    setState(() {
                      if(pickedTime!=null){
                        time = '${pickedTime.hour}:${pickedTime.minute}';
                        print('selected time - ${pickedTime.hour}:${pickedTime.minute}');
                      }
                      else{
                        time = '__ : __';
                      }
                    });

                  }, child: Text('Select Time')),
              SizedBox(height: 30,),
              Container(
                color: Colors.cyanAccent,
                width: 200,
                height:100,
                child:
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$date",style: TextStyle(fontSize: 20),),
                      Text('$time',style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
