import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:final_trial/screens/flash_card.dart';

const mainColor = Color.fromARGB(255, 96, 71, 102);

const cardTextStyle = TextStyle(fontSize: 20, letterSpacing: 1.0);
const otherTextStyle = TextStyle(fontSize: 15);

class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  FlashCardState createState() => FlashCardState();
}

class FlashCardState extends State<FlashCard> {
  int _currentIndexNumber = 0;
  double _initial = 0.1;

  @override
  Widget build(BuildContext context) {
    String value = (_initial * 10).toStringAsFixed(0);
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Flashcards App", style: TextStyle(fontSize: 30)),
            backgroundColor: mainColor,
            toolbarHeight: 80,
            elevation: 5,
            shadowColor: mainColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text("Question $value of 10 Completed", style: otherTextStyle),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: const AlwaysStoppedAnimation(Colors.pinkAccent),
                  minHeight: 5,
                  value: _initial,
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                  width: 300,
                  height: 300,
                  child: FlipCard(
                      direction: FlipDirection.VERTICAL,
                      front: ReusableCard(
                          text: quesAnsList[_currentIndexNumber].question),
                      back: ReusableCard(
                          text: quesAnsList[_currentIndexNumber].answer))),
              const Text("Tab to see Answer", style: otherTextStyle),
              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton.icon(
                        onPressed: () {
                          showPreviousCard();
                          updateToPrev();
                        },
                        icon: const Icon(FontAwesomeIcons.handPointLeft, size: 30),
                        label: const Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.only(
                                right: 20, left: 25, top: 15, bottom: 15))),
                    ElevatedButton.icon(
                        onPressed: () {
                          showNextCard();
                          updateToNext();
                        },
                        icon: const Icon(FontAwesomeIcons.handPointRight, size: 30),
                        label: const Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.only(
                                right: 20, left: 25, top: 15, bottom: 15)))
                  ])
            ])));
  }

  void updateToNext() {
    setState(() {
      _initial = _initial + 0.1;
      if (_initial > 1.0) {
        _initial = 0.1;
      }
    });
  }

  void updateToPrev() {
    setState(() {
      _initial = _initial - 0.1;
      if (_initial < 0.1) {
        _initial = 1.0;
      }
    });
  }

  void showNextCard() {
    setState(() {
      _currentIndexNumber = (_currentIndexNumber + 1 < quesAnsList.length)
          ? _currentIndexNumber + 1
          : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndexNumber = (_currentIndexNumber - 1 >= 0)
          ? _currentIndexNumber - 1
          : quesAnsList.length - 1;
    });
  }
}

// import 'package:flutter/material.dart';

// import 'package:flip_card/flip_card.dart';

// class Flashcard extends StatefulWidget {
//   const Flashcard({Key? key}) : super(key: key);

//   @override
//   FlashcardState createState() => FlashcardState();
// }

// class FlashcardState extends State<Flashcard> {
//   _renderBg() {
//     return Container(
//       decoration: BoxDecoration(color: const Color(0xFFFFFFFF)),
//     );
//   }

//   _renderAppBar(context) {
//     return MediaQuery.removePadding(
//       context: context,
//       removeBottom: true,
//       child: AppBar(
//         elevation: 0.0,
//         backgroundColor: Color(0x00FFFFFF),
//       ),
//     );
//   }

//   _renderContent(context) {
//     return Card(
//       elevation: 0.0,
//       margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
//       color: Color(0x00000000),
//       child: FlipCard(
//         direction: FlipDirection.HORIZONTAL,
//        // fill: CardSide.FRONT,
//         speed: 1000,
//         onFlipDone: (status) {
//           print(status);
//         },
//         front: Container(
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 96, 71, 102),        ,
//             borderRadius: BorderRadius.all(Radius.circular(8.0)),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Front', style: Theme.of(context).textTheme.headline1),
//               Text('Click here to flip back',
//                   style: Theme.of(context).textTheme.bodyText1),
//             ],
//           ),
//         ),
//         back: Container(
//           decoration: BoxDecoration(
//             color: Color(0xFF006666),
//             borderRadius: BorderRadius.all(Radius.circular(8.0)),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Back', style: Theme.of(context).textTheme.headline1),
//               Text('Click here to flip front',
//                   style: Theme.of(context).textTheme.bodyText1),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('FlipCard'),
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           _renderBg(),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               _renderAppBar(context),
//               Expanded(
//                 flex: 4,
//                 child: _renderContent(context),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Container(),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
