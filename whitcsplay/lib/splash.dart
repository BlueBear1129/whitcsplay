import 'package:flutter/material.dart';
import 'splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'WELCOME TO C++ PLAYGROUND',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
