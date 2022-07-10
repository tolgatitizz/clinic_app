import 'package:clinic_app/Screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clinic App"),
      ),
      body: Center(
        child: TextButton(
          child: Text("Sign in"),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login_Screen()),);
      },
        ),
      ),
    );
  }
}
