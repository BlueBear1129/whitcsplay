import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'textbox.dart';

// Lessons from introduction to programming textbook

// srcs : stackoverflow , youtube
// This is the same code from the previous lessons page

class Lessonsone extends StatelessWidget {
  const Lessonsone({Key? key}) : super(key: key);

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
      home: const LessonsonePage(title: 'What is C++ Lessons Page'),
    );
  }
}

class LessonsonePage extends StatefulWidget {
  const LessonsonePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LessonsonePage> createState() => _LessonsonePageState();
}

class _LessonsonePageState extends State<LessonsonePage> {
  // displaying text on the green part of the chalk board from a txt file.
  String? dataone;
  
  void _loadData() async {
    final _loadedData =
        await rootBundle.loadString('lib/textfile/lessonsprogramming.txt');
    setState(() {
      dataone = _loadedData;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }
  
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    const SizedBox(height: 30);
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('Next Lesson'),
          );
            
  
    return Scaffold(
      appBar: AppBar(
        // Setting app title bar and including a back arrow to the previous page.
        title: const Text(' What is C++ Lessons Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, '/home'),
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
              const Text('Lessons Page'),
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
                child: TextBox(text: dataone ?? 'empty'),
              ),
              // displaying instructor image/gif
               Positioned(
                  top: 150,
                  left: 310,
                  child: Image.asset('assets/images/Teacher.gif',
                      width: 300.0, height: 380.0)),

              Positioned(
                     top: 60,
                     left: 30,
                     child: Text(dataone ?? 'empty',style: const TextStyle(color: Colors.white))
                     
                     ),
                  
                  
              // Practice lesson button to navigate to the Practice screen.
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 14),
                ),
                onPressed: () {},
                child: const Text('Practice Lesson'),
              ),

              //Image.network('https://tenor.com/view/jobs-and-care-teacher-black-teacher-working-families-wfp-gif-20942731'),
            ],
          ),
        ),
      ),
      // next lesson button to navigate to the next screen/ lesson.
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/lesson3');
        },
        label: const Text('Next Lesson'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
