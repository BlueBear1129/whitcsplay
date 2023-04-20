// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import
// APP-PINE CS-375 FINAL DEMO
// Member name :- Diana Diaz, Lester Dery, A Bhilash, Nana Boateng Amoah
// Date : 5/17/22
// Professor : Kent Jones
////////////
///
/////
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; // new
import 'package:whitcsplay/Lessons.dart';
import 'package:whitcsplay/home_screen.dart';
//import 'package:whitcsplay/lessons.dart';
import 'package:whitcsplay/loginRegester/logReg.dart';
import 'package:whitcsplay/model/quizmodel.dart';
import 'package:whitcsplay/practice_screen.dart';
import 'package:whitcsplay/screens/promptscreen.dart';
import 'package:whitcsplay/splash_page.dart';
import 'firebase_options.dart'; // new
import 'lessonscs.dart';
import 'lessonsvariable.dart';
import 'src/authentication.dart'; // new
import 'src/widgets.dart';
import 'package:whitcsplay/data/questions.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:js';
import 'package:deep_pick/deep_pick.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  List fromJSON = []; // Get's data content from JSON
  bool LoadJSON = false; // determines if JSON needs to be loaded again.

  List<QuizTemplate> _questions = [];

  // Fetch Quiz questions from Question Bank in a JSON format.
  ///
  Future<void> readJSON() async {
    final response = await rootBundle.loadString('assets/quiz.json');
    final data = await jsonDecode(response);

    setState(() {
      fromJSON = data['bank'];

      for (int i = 0; i < fromJSON.length; i++) {
        QuizTemplate quiz =
            QuizTemplate.fromJson(fromJSON, i); // create quiz object.
        _questions.add(
            QuizTemplate(quiz.Question, quiz.AnswerOptions)); // adds to _Question bank
      }
      LoadJSON = true;
    });
  }

/////////

  @override
  Widget build(BuildContext context) {
    if (LoadJSON == false) {
      readJSON(); // check to see if the JSON works.
    }

    return MaterialApp(
      title: 'CSPlayGround',
      home: SplashPage(),
      initialRoute: '/',
      routes: {
        '/LoginOrReg': (context) =>
            const LoginPage(), //navigates to login / register page

        '/home': (context) => const HomeScreen(), //navigates to home screen

        '/lesson1': (context) =>
            Lessons(quest: _questions), //navigates to first lesson page

        '/lesson2': (context) =>
            const Lessonsone(), //navigates to 2 lesson page

        '/lesson3': (context) =>
            const Lessonstwo(), //navigates to 3 lesson page
        '/quiz': (context) => PromptScreen(questions: _questions),
      },
    );
  }
}

// Connects to Online Firebase
class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String? _email;
  String? get email => _email;

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> registerAccount(
      String email,
      String displayName,
      String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
