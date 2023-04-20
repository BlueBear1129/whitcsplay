// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:whitcsplay/model/quizmodel.dart';
import 'package:whitcsplay/screens/results.dart';
import 'package:whitcsplay/ui/colorscheme.dart';
//import 'package:whitcsplay/data/questions.dart';

class PromptScreen extends StatefulWidget {
  List<QuizTemplate> questions;

  PromptScreen({Key? key, required this.questions}) : super(key: key);

  List<QuizTemplate> getQuest() {
    return questions;
  }

  @override
  // ignore: no_logic_in_create_state
  PromptScreenState createState() => PromptScreenState(questions: questions);
}

class PromptScreenState extends State<PromptScreen> {
  List<QuizTemplate> questions;

  // Constructor
  PromptScreenState({Key? key, required this.questions});

  // Member Variables
  int QuestioNum = 0;
  int points = 0;
  bool ButtonPressed = false;
  PageController? _controller;
  String ButtonText = 'Next';
  bool answered = false;

  @override
  void initState() {
    super.initState();
    //readJson(questions); // Load Questions from QuestionBank.
    _controller = PageController(initialPage: 0);
    //question = _question
  }

  @override
  Widget build(BuildContext context) {
    // Load Questions into Memory

    return Scaffold(
      backgroundColor: ScreenColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: PageView.builder(
          // Builds the Questions from Frame.
          controller: _controller!,
          onPageChanged: (page) {
            if (page == questions.length - 1) {
              // When the User Finishes playing the Quiz
              setState(() {
                ButtonText = 'Check Scores';
                
              });
            }
            setState(() {
              answered = false;
            });
          },
          physics: NeverScrollableScrollPhysics(), // Static Screen
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Question ${index + 1}/${questions.length}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 200.0,
                  child: Text(
                    "${questions[index].Question}",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
                for (int i = 0; i < questions[index].AnswerOptions!.length; i++)
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    margin:
                        EdgeInsets.only(bottom: 20.0, left: 12.0, right: 12.0),
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fillColor: ButtonPressed
                          ? questions[index].AnswerOptions!.values.toList()[i]
                              ? Colors.green
                              : Colors.red
                          : ScreenColor
                              .secondColor, // Green color menas answer is correct, red means its not correct.
                      onPressed: !answered
                          ? () {
                              // Handles the Logic of Answering Questions and awarding Points
                              if (questions[index]
                                  .AnswerOptions!
                                  .values
                                  .toList()[i]) {
                                // Awards points when answer correct.
                                points++;
                                print("Correct Answer");
                              } else {
                                print("Incorrect Answer");
                              }
                              setState(() {
                                ButtonPressed = true;
                                answered = true;
                              });
                            }
                          : null,
                      child: Text(
                          questions[index].AnswerOptions!.keys.toList()[i]),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 40.0,
                ),
                RawMaterialButton(
                  onPressed: () {
                    // Moves to the Results Screen after you done with Quiz.
                    if (_controller!.page?.toInt() == questions.length - 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Result(points)));
                    } else {
                      _controller!.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInExpo);

                      setState(() {
                        ButtonPressed = false;
                      });
                    }
                  },
                  shape: StadiumBorder(), // blank space.
                  fillColor: Colors.blue,
                  padding: EdgeInsets.all(18.0),
                  elevation: 0.0,
                  child: Text(
                    ButtonText,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
