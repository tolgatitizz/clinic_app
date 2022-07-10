import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main_screen_user.dart';

enum Gender{
  male,
  female
}

class Bmi_Screen extends StatefulWidget {

  @override
  State<Bmi_Screen> createState() => _Bmi_ScreenState();
}

class _Bmi_ScreenState extends State<Bmi_Screen> {

  double _currentSliderValueHeight = 140;
  double _currentSliderValueWeight = 60;
  double _yearsOld = 30;
  Gender gender = Gender.female;


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    color: gender == Gender.male ? Colors.white60 : Colors.white,
                    child: InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.mars),
                          Text("Erkek"),
                        ],
                      ),
                      onTap: (){
                        setState((){
                          gender = Gender.male;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: gender == Gender.female ? Colors.white60 : Colors.white,
                    child: InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.venus),
                          Text("Kadın"),
                        ],
                      ),
                      onTap: (){
                        setState((){
                          gender = Gender.female;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            ),
            Expanded(
              flex: 4,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height",
                    textAlign: TextAlign.center,),
                    Text("$_currentSliderValueHeight cm",
                      textAlign: TextAlign.center,
                    ),
                    Slider(
                      value: _currentSliderValueHeight,
                      max: 240,
                      divisions: 200,
                      min: 40,
                      label: _currentSliderValueHeight.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValueHeight = value;
                        });
                      },
                    ),
                  ],
                ),
            ),
            ),
      Expanded(
        flex: 4,
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("WEIGHT",
                    textAlign: TextAlign.center,),
                  Text("$_currentSliderValueWeight kg",
                    textAlign: TextAlign.center,
                  ),
                  Slider(
                    value: _currentSliderValueWeight,
                    max: 200,
                    divisions: 190,
                    min: 10,
                    label: _currentSliderValueWeight.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValueWeight = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yaş",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "$_yearsOld",
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState((){
                            _yearsOld--;
                          }
                          );
                        },
                        child: FaIcon(FontAwesomeIcons.minus),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(14),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState((){
                            _yearsOld++;
                          }
                          );
                        },
                        child: FaIcon(FontAwesomeIcons.plus),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ],
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
              ),
        ),
      ],
    ),
    ),
    );
  }
}
