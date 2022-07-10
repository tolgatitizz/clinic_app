import 'package:clinic_app/Screens/main_screen_user.dart';
import 'package:flutter/material.dart';


class Login_Screen extends StatefulWidget {

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Text("Login Screen"),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Text(
                      "E-posta adresi"
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22,top: 0,right: 22,bottom: 8),
                    child: TextField(
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text("Şifre alanı"),
                  Padding(
                    padding: const EdgeInsets.only(left: 22,top: 0,right: 22,bottom: 8),
                    child: TextField(
                      textAlign: TextAlign.center,

                    ),
                  ),
                ],
              ),
            ),
           Align(
             alignment: Alignment.bottomRight,
             child: TextButton(
               child: Text("Next Step"),
               onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Main_Screen_User()),);
               },
             )
           )
          ],
        ),
      ),
    );
  }
}
