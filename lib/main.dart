import 'package:flutter/material.dart';
import 'package:w/Quiz.dart';
import 'package:w/Quize_home.dart';
import 'package:w/Resalt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => QuizHome(),
        '/quiz': (context) => QuizScreen(),
        '/resulte': (context) => const ResultScreen(),
      },
    );
  }
}
