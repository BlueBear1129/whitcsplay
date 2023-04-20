// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whitcsplay/home_screen.dart';
import 'package:whitcsplay/model/quizmodel.dart';
import 'package:whitcsplay/model/quizmodel.dart';
import 'package:whitcsplay/screens/promptscreen.dart';
import 'textbox.dart';

// Lessons from introduction to programming textbook
// srcs : stackoverflow , youtube
// https://stackoverflow.com/questions/69275567/flutter-how-to-read-text-fil, required List<QuizTemplate> quest, required List<QuizTemplate> questionses-from-asset-and-show-it-to-container

class Lessons extends StatelessWidget {
  
  Lessons({Key? key, required this.quest}) : super(key: key);

  
  List<QuizTemplate> quest;

  // This widget is the root of your application.
  //Top bar and screen labeling and decoration.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lessons',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.lightBlue[100],
      ),
      home: LessonsPage(
        title: 'Lessons Page',
        questions: quest,
      ),
    );
  }
}

// Lessons page as a statefulwidget
// with a title requirement
class LessonsPage extends StatefulWidget {
  LessonsPage({Key? key, required this.title, required this.questions})
      : super(key: key);

  final String title;
  List<QuizTemplate> questions;

  @override
  State<LessonsPage> createState() => _LessonsPageState(questions: questions);
}

class _LessonsPageState extends State<LessonsPage> {
  // displaying text on the green part of the chalk board from a txt file.
  String? data;
  List<QuizTemplate> questions = [];

  _LessonsPageState({Key? key, required this.questions});

  void _loadData() async {
    final _loadedData =
        await rootBundle.loadString('../lib/textfile/lessonsfile.txt');
    setState(() {
      data = _loadedData;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    const SizedBox(height: 30);
    ElevatedButton(
      style: style,
      onPressed: () {
        Navigator.pushNamed(context, '/lesson2');
      }, // needs to move to new page.<issue>
      child: const Text('Next Lesson'),
    );

    return Scaffold(
      appBar: AppBar(
        // Setting app title bar and including a back arrow to the previous page.
        title: const Text(
            'Intro to Programming Lessons Page'), // should be dynamic
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomeScreen())),
        ),

        //backgroundColor: Colors.red.withOpacity(0.1), //You can make this transparent
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Stack(
            children: <Widget>[
              const Text('Intro to Programming Page'),
              // creating the brown parts/layer of the chalkboard
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: Color(0xff8b4513),
                ),
                constraints: const BoxConstraints(
                  maxHeight: 450.0,
                  maxWidth: 500.0,
                  minWidth: 500.0,
                  minHeight: 450.0,
                ),
              ),
              // Calling the text box with the displayed text from the textbox.dart file
              Positioned(
                top: 25,
                left: 18,
                child: TextBox(text: data ?? 'empty-lessons'),
              ),
              // displaying instructor image/gif
              Positioned(
                  top: 150,
                  left: 310,
                  child: Image.asset('assets/images/Teacher.gif',
                      width: 300.0, height: 380.0)),

              // Practice lesson button to navigate to the Practice screen.
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 14),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/quiz');
                },
                child: const Text('Practice Lesson'),
              ),

              //Image.network('https://tenor.com/view/jobs-and-care-teacher-black-teacher-working-families-wfp-gif-20942731'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PromptScreen(questions: questions)));
        },
        label: const Text('Practice Lesson'),
        backgroundColor: const Color.fromARGB(255, 30, 233, 159),
      ),
    );
  }
}
