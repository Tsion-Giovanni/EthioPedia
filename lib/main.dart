import 'package:final_trial/intro_slider_custom_config.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IntroScreenCustomConfig(),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/favorite-screen': (BuildContext context) => const Favorites(),
      //   '/flashcard-screen': (BuildContext context) => const Flashcards(),
      //   '/quiz-screen': (BuildContext context) => const Quiz()
      // },
      // routes: {
      //   // Main initial route
      //   '/': (context) => IntroScreenCustomConfig(),
      //   // Second route
      //   '/second': (context) => MyHomePage(),
      // },
      // initialRoute: '/',
    );
  }
}
