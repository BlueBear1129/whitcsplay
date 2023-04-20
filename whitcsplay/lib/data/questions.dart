import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:whitcsplay/model/quizmodel.dart';

// List that Holds all the Questions in Memory. // Used for testing purposes. 
List<QuizTemplate> _questions = [
  QuizTemplate(
    "Correct way to declare a variable of type integer",
    {
      "number a: ": false,
      "int b; ": true,
      "int b:": false,
      "number a": false,
    },
  ),
  QuizTemplate(
    "Which is the correct Syntax. ",
    {
      "number b = 0;": false,
      "int a = 0.356; ": false,
      "int a = 0 +4; ": true,
      "int a = 0+ b": false,
    },
  ),
  QuizTemplate(
    "What is the correct way of Appending Strings",
    {
      "string a = \"He\" + \"llo\"": true,
      "string a = \"He\" plus \"llo\"": false,
      "string a = \"He\" // \"llo\"": false,
      "No correct Option": false,
    },
  ),
  QuizTemplate(
    "What is not true about C++",
    {
      "It has object oriented features": false,
      "Compiles on different platforms": false,
      "Very Popular": false,
      "Widely used in web-development": true,
    },
  ),
  QuizTemplate(
    "How to initialize a string in C++",
    {
      "str word = `hello`;": false,
      "string word = \"hello\"": true,
      "word letter = 123": false,
      "string word = 456;": false,
    },
  ),
];

