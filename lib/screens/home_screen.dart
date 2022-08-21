import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:./anim_search_bar/anim_search_bar.dart';
import 'package:final_trial/intro_slider_custom_config.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'dart:async';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:final_trial/screens/quiz_screen.dart';
import 'package:final_trial/screens/flashcard_screen.dart';
import 'package:final_trial/screens/home_screen.dart';
import 'package:final_trial/screens/category_screen.dart';
import 'package:http/http.dart' as http;

import 'package:final_trial/screens/searchdeleget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  //final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  TextEditingController textController = TextEditingController();
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Color.fromRGBO(96, 71, 102, 1),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      // ignore: sort_child_properties_last
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          actions: [
            IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search),
            )
          ],
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),

          backgroundColor: Color.fromRGBO(96, 71, 102, 1),
          // bottom: PreferredSize(
          //   preferredSize: Size.fromHeight(0.0),
          //   child: Image.asset('images/title.png', fit: BoxFit.fitHeight),
          // ),
          elevation: 6,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 100),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10, left: 10),
                //   child: AnimSearchBar(
                //     width: 400,
                //     textController: textController,
                //     onSuffixTap: () {
                //       showSearch(
                //           context: context,
                //           // delegate to customize the search bar
                //           delegate: CustomSearchDelegate());
                //     },
                //     rtl: true,
                //     suffixIcon: Icon(
                //       Icons.search,
                //       size: 20.0,
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 200
                // ),
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: <Widget>[
                //     SizedBox(
                //       width: 250.0,
                //       child: TextLiquidFill(
                //         text: 'EthioPedia',
                //         waveColor: Colors.blueAccent,
                //         boxBackgroundColor: Colors.redAccent,
                //         textStyle: TextStyle(
                //           fontSize: 80.0,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         boxHeight: 300.0,
                //       ),
                //     ),
                //   ],
                // ),
                AnimatedButton(
                  child: Text(
                    'Animals',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  color: const Color.fromARGB(255, 96, 71, 102),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const GridView()),
                    // );
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                  height: 45,
                ),
                SizedBox(height: 10),
                AnimatedButton(
                  child: Text(
                    'History',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  color: const Color.fromARGB(255, 96, 71, 102),
                  onPressed: () {
                    // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => AnotherPage()));
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                  height: 45,
                ),
                SizedBox(height: 10),
                AnimatedButton(
                  child: Text(
                    'People',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  color: const Color.fromARGB(255, 96, 71, 102),
                  onPressed: () {
                    // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => AnotherPage()));
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                  height: 45,
                ),
                const SizedBox(height: 10),
                AnimatedButton(
                  child: Text(
                    'Place',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  color: const Color.fromARGB(255, 96, 71, 102),
                  onPressed: () {
                    // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => AnotherPage()));
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                  height: 45,
                ),
              ]),
        ),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'images/logo.png',
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FlashCard()),
                    );
                  },
                  leading: Icon(Icons.credit_card),
                  title: Text('Flashcard'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizPage()),
                    );
                  },
                  leading: Icon(Icons.quiz_rounded),
                  title: Text('Quiz'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

class _search {}
