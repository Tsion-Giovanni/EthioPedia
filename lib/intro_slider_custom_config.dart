import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:final_trial/main.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:final_trial/screens/home_screen.dart';

class IntroScreenCustomConfig extends StatefulWidget {
  const IntroScreenCustomConfig({Key? key}) : super(key: key);

  @override
  IntroScreenCustomConfigState createState() => IntroScreenCustomConfigState();
}

class IntroScreenCustomConfigState extends State<IntroScreenCustomConfig> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        pathImage: "images/place.png",
        title: "Interactive \n Encyclopedia ",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono',
        ),
        description:
            "No more boring text only. Support your searched items with videos and pictures",
        styleDescription: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
        ),
        marginDescription: const EdgeInsets.only(
          left: 50.0,
          right: 50.0,
          top: 40.0,
          bottom: 50.0,
        ),
        backgroundColor: const Color.fromARGB(255, 96, 71, 102),
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      Slide(
        pathImage: "images/world.png",
        title: "Knowing all about your homeland",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono',
        ),
        description:
            "Discover what it truly means to be Ethiopian. The first ever encyclopedia specifically made for Ethiopian content",
        styleDescription: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
        ),
        marginDescription: const EdgeInsets.only(
          left: 50.0,
          right: 50.0,
          top: 40.0,
          bottom: 50.0,
        ),
        colorBegin: Color.fromARGB(255, 96, 71, 102),
        colorEnd: Color.fromARGB(255, 96, 71, 102),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      Slide(
        title: "Remember Me",
        styleTitle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono',
        ),
        description:
            "Quizzes and flash cards that will help and make you enjoy in your learning",
        styleDescription: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
        ),
        marginDescription: const EdgeInsets.only(
          left: 50.0,
          right: 50.0,
          top: 40.0,
          bottom: 50.0,
        ),
        pathImage: "images/question.png",
        //backgroundImage: "images/qupg.png",
        backgroundColor: const Color.fromARGB(255, 96, 71, 102),
        maxLineTextDescription: 3,
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  }

  void onNextPress() {
    log("onNextPress caught");
  }

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      color: Color.fromARGB(255, 255, 255, 255),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      color: Color.fromARGB(255, 255, 255, 255),
    );
  }

  Widget renderSkipBtn() {
    return const Icon(
      Icons.skip_next,
      color: Color.fromARGB(255, 255, 255, 255),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color.fromARGB(55, 96, 71, 102),
      ),
      overlayColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 255, 255, 255)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      slides: slides,

      // Skip button
      renderSkipBtn: renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: renderNextBtn(),
      onNextPress: onNextPress,
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: const Color.fromARGB(255, 255, 255, 255),
      colorActiveDot: const Color.fromARGB(150, 90, 25, 106),
      sizeDot: 13.0,

      // Behavior
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,
      verticalScrollbarBehavior: ScrollbarBehavior.SHOW_ALWAYS,
      autoScroll: true,
      loopAutoScroll: true,
      curveScroll: Curves.bounceIn,
    );
  }
}
