// ignore_for_file: deprecated_member_use

import 'package:whitcsplay/screens/promptscreen.dart';
import 'package:flutter/material.dart';
import 'package:whitcsplay/ui/colorscheme.dart';


// ignore: must_be_immutable
class Result extends StatefulWidget {
  int points;

  Result(this.points, {Key? key}) : super(key: key);

  @override
  ResultState createState() => ResultState(); 
}

class ResultState extends State<Result> { 

  @override  
  Widget build(BuildContext context ) { 
    return Scaffold(
      backgroundColor: ScreenColor.primaryColor,
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          const SizedBox(
            width: double.infinity,
            child: Text(
              "Exllencia",
              textAlign: TextAlign.center,
              style: TextStyle( 
                color: Colors.white,  
                fontSize: 40.0, 
                fontWeight: FontWeight.bold ,
              ),
            ),
          ), 
          const SizedBox( height: 45.0, ), 
          const Text( 
            "Total points is", style: TextStyle(color: Colors.white, fontSize: 34.0),), 
          const SizedBox( height: 20.0,),
          Text( 
            "${widget.points}", 
            style: const TextStyle(
              color: Colors.orange, 
              fontWeight: FontWeight.bold,
              fontSize: 85.0,
            ),        
          ),
          const SizedBox( height: 100.0,
          ), 
           RaisedButton(
             onPressed: () {
               Navigator.push( 
                 context, 
                MaterialPageRoute(builder: (context) => PromptScreen(questions: [],),)
               ); 
             }, 
             // ignore: prefer_const_constructors
             shape: StadiumBorder(),
             color: ScreenColor.secondColor,
             padding: const EdgeInsets.all(18.0),
             child: const Text(
               "Repeat the Quiz", 
               style: TextStyle(color: Colors.white),
             ),
           ), 
        ], 
      ), 
    ); 
    }      
}
