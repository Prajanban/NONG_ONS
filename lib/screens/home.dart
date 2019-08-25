import 'package:flutter/material.dart';
import 'package:nong_ons/screens/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Method

  Widget mySizebox() {
    return SizedBox(
      width: 5.0,
    );
  }

  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        color: Colors.blue.shade400,
        child: Text('Sign In'),
        onPressed: () {},
      ),
    );
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.blue.shade400),
        ),
        onPressed: () {
          print('You CLick SignUp');
//Route แบบมี Aero back  การสืบทอด class ใน flutter
//เรียกหน้า Registerมาแสดงเมื่อมีการกดปุ่ม SignUp
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => Register());
              Navigator.of(context).push(materialPageRoute)
        },
      ),
    );
  }

  Widget showButton() {
    return Container(
      margin: EdgeInsets.only(left: 50.0, right: 50.0),
      child: Row(
        children: <Widget>[signInButton(), mySizebox(), signUpButton()],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 150.0,
        height: 150.0,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Widget showAppName() {
    return Text('My First App');
  }

  Widget showAppName2() {
    return Text(
      'BAN SOFT',
      style: TextStyle(
        fontSize: 35.0,
        fontFamily: 'Lobster',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: [Colors.white, Colors.blue],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[showLogo(), showAppName2(), showButton()],
        ),
      ),
    );
  }
}
