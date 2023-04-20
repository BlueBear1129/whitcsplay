
// Handles the UI Frame of the Quiz

import 'package:flutter/material.dart';
import 'package:whitcsplay/ui/colorscheme.dart';
import 'package:whitcsplay/model/quizmodel.dart';


// This Displays Each Question Prompt in a UI Format. 
Widget framewidget(
    QuizTemplate prompt, void Function() function, bool pressed) {
  return Column(
    children: [
      SizedBox(
          width: double.infinity,
          height: 200,
          child: Text(
            "${prompt.Question}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          )),
      for (int i = 0; i < prompt.AnswerOptions!.length; i++) // Index Questions.
        Container(
          width: double.infinity,
          height: 50.0,
          margin: const EdgeInsets.only(bottom: 20.0, left: 12.0, right: 13.0),
          child: RawMaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            fillColor: ScreenColor.secondColor,
            onPressed: function,
            child: Text(prompt.AnswerOptions!.keys.toList()[i]),
          ),
        )
    ],
  );
}
