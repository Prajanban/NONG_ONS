import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget showAppName(){
    return Text('My Home');
  }
  Widget showAppName2(){
    return Text('BAN SOFT');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[showAppName(),showAppName2()],),
    );
  }
}