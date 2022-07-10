import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'main_screen_user.dart';

class Appointment_Screen extends StatefulWidget {

  @override
  State<Appointment_Screen> createState() => _Appointment_ScreenState();
}


class _Appointment_ScreenState extends State<Appointment_Screen> {

  static List<String> nameList = ["Name1Surname1","Name2Surname2","Name3Surname3","Name4Surname4"];
  int selectedClinic = 0;
  String squareLogo = "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-goog/events/flutter_LyrTDuc.jpg";
  String selectedName= nameList.first;
  int selectedDate = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 2,child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: InkWell(
                    child: Image.network(squareLogo,width: 40,height: 40,),
                    onTap: (){
                      setState((){
                        selectedClinic = 1;
                      });
                    },
                  ),
                ),
                Card(
                  child: InkWell(
                    child: Image( image: NetworkImage(squareLogo), width: 40,height: 40,),
                    onTap: (){
                      setState((){
                        selectedClinic = 2;
                      });
                    },
                  ),
                ),
                Card(
                  child: InkWell(
                    child: Image( image: NetworkImage(squareLogo), width: 40,height: 40,),
                    onTap: (){
                      setState((){
                        selectedClinic = 3;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(
            flex: 2,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Name Selection",
                  textAlign: TextAlign.center,),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 30,
                    onPageChanged: (index, reason) {
                      setState(() {
                        selectedName = nameList.elementAt(index); //<-- Page index
                      });
                    },
                    ),
                    items: nameList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Card(
                              child: Text('${i} ', style: TextStyle(fontSize: 16.0),)
                          );
                          },
                      );
                    }).toList(),
                  ),
                  Text(
                      "${selectedName}",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
            children: [
              SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: dayAndTime(start: DateTime(0,0,1,2,15),end: DateTime(0,0,1,8,30),duration: Duration(hours: 0, minutes: 15), pickedTimes: [],),)),
              SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: dayAndTime(start: DateTime(0,0,2,2,15),end: DateTime(0,0,2,8,30),duration: Duration(hours: 0, minutes: 15), pickedTimes: [],),)),
              SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: dayAndTime(start: DateTime(0,0,3,2,15),end: DateTime(0,0,3,8,30),duration: Duration(hours: 0, minutes: 15), pickedTimes: [],),)),
              SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: dayAndTime(start: DateTime(0,0,4,2,15),end: DateTime(0,0,4,8,30),duration: Duration(hours: 0, minutes: 15), pickedTimes: [],),)),
              SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: dayAndTime(start: DateTime(0,0,5,2,15),end: DateTime(0,0,5,8,30),duration: Duration(hours: 0, minutes: 15), pickedTimes: [],),)),
              SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: dayAndTime(start: DateTime(0,0,6,2,15),end: DateTime(0,0,6,8,30),duration: Duration(hours: 0, minutes: 15), pickedTimes: [],),)),
              SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: dayAndTime(start: DateTime(0,0,7,2,15),end: DateTime(0,0,7,8,30),duration: Duration(hours: 0, minutes: 15), pickedTimes: [],),)),

            ],
          ),
          ),
          Expanded(
            flex: 2,
            child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    selectedClinic.toString(),
                  textAlign: TextAlign.center,
                ),
                Text(selectedName,
                  textAlign: TextAlign.center,),
                Text(selectedDate.toString(),
                  textAlign: TextAlign.center,),
              ],
            ),
          ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
            child: Text("Next"),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Main_Screen_User()),);
            },
          ),),
        ],
      ),
    );
  }

  List<Widget> dayAndTime({required DateTime start,required DateTime end,required Duration duration,required List<double> pickedTimes,}){
    List<Widget> showAvailableTimes = [];
    List<String> days = ["null","Pazartesi","Salı","Çarşamba","Perşembe","Cuma","Cumartesi","Pazar"];
    showAvailableTimes.add(
      Container(
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(days.elementAt(start.day)),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 2,),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),topLeft: Radius.circular(8))
        ),
      ),
    );
    int i = 0;
    while (!start.isAtSameMomentAs(end)){


      start = start.add(duration);
      showAvailableTimes.add(new ElevatedButton(key: Key(i.toString()),child: Text("${start.hour}.${start.minute}"),style: ElevatedButton.styleFrom( primary: selectedDate ==i ?Colors.black54 : Colors.amber), onPressed: (){
        setState((

            ){
        });
      },));
      i++;
    };
    print(selectedDate);
    return showAvailableTimes;
  }
}


