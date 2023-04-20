// ignore_for_file: prefer_const_constructors, deprecated_member_use, camel_case_types
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 76, 139, 175),
      appBar: AppBar(
          title: const Text("CHOSE A C++ LEVEL"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 38, 0)),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Column(children: [
          const Text(
            '     You Will Be Given Lesson Based on Your \n     Selection:',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSans',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.all(50),
            height: 35.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
              onPressed: () {
                Navigator.pushNamed(context, '/lesson1');
              },
              padding: EdgeInsets.all(10.0),
              color: Colors.red,
              textColor: Colors.white,
              child: Text("          Level 1          ",
                  style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(50),
            height: 35.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
              onPressed: () {
                Navigator.pushNamed(context, '/lesson2');
              },
              padding: EdgeInsets.all(10.0),
              color: Colors.pink,
              textColor: Colors.white,
              child: Text("          Lesson 2          ",
                  style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(50),
            height: 35.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
              onPressed: () {
                Navigator.pushNamed(context, '/lesson3');
              },
              padding: EdgeInsets.all(10.0),
              color: Color.fromARGB(255, 244, 225, 54),
              textColor: Colors.white,
              child: Text("          Level 3          ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          Container( // Quiz Practice Button.
            margin: EdgeInsets.all(50),
            height: 35.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
              onPressed: () {
                //(questions); // build the questions to be used in-program.
                Navigator.pushNamed(context, '/quiz');
                
              },
              padding: EdgeInsets.all(10.0),
              color: Colors.red,
              textColor: Colors.white,
              child: Text("          Quiz Practice          ",
                  style: TextStyle(fontSize: 20)),
            ),
          )
        ]),
      ),
    );
  }

  
}
