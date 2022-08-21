import 'package:animated_button/animated_button.dart';
import 'package:final_trial/screens/flashcard_screen.dart';
import 'package:final_trial/screens/quiz_screen.dart';
import 'package:final_trial/screens/searchdeleget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  //final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: const Color.fromRGBO(96, 71, 102, 1),
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
        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),

          backgroundColor: const Color.fromRGBO(96, 71, 102, 1),
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
                  child: const Text(
                    'Animals',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedButton(
                  color: const Color.fromARGB(255, 96, 71, 102),
                  onPressed: () {
                    // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => AnotherPage()));
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                  height: 45,
                  child: const Text(
                    'History',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedButton(
                  color: const Color.fromARGB(255, 96, 71, 102),
                  onPressed: () {
                    // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => AnotherPage()));
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                  height: 45,
                  child: const Text(
                    'People',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedButton(
                  color: const Color.fromARGB(255, 96, 71, 102),
                  onPressed: () {
                    // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => AnotherPage()));
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                  height: 45,
                  child: const Text(
                    'Place',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
                  decoration: const BoxDecoration(
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
                  leading: const Icon(Icons.credit_card),
                  title: const Text('Flashcard'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizPage()),
                    );
                  },
                  leading: const Icon(Icons.quiz_rounded),
                  title: const Text('Quiz'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: const Text('Terms of Service | Privacy Policy'),
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
