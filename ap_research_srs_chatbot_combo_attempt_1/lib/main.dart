import 'package:ap_research_srs_chatbot_combo_attempt_1/deckHandler.dart';
import 'package:ap_research_srs_chatbot_combo_attempt_1/vocabWord.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //gonna need to change the color's to somthing besides blue prob
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'SRS Demo Program'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _displayedWord;
  int runningThrough = 0;
  //used to add 3 test words to the list, remove once done testing
  bool hasntOccured = true;
  //declerations
  var practiceDeck = new DeckHandler();

  //temp words to test the srs systems with

  //creates a text editing controller that allows us to handle inputs from users and assign new words
  TextEditingController keyboardMonkey = TextEditingController();

  void _incrementCounter() {
    setState(() {
      if (practiceDeck.currentReviews.length > 1) {
        if (runningThrough < practiceDeck.currentReviews.length - 1) {
          runningThrough++;
        }
        _displayedWord = practiceDeck.currentReviews[runningThrough].getWord();
        print(_displayedWord);
      } else {
        // this is temp, need to replace with some sort of onscreen alert cause the user will never see this rn
        print("no words need to be reviewed right now!");
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (runningThrough > 0) {
        runningThrough--;
      }
      _displayedWord = practiceDeck.currentReviews[runningThrough].word;
    });
  }

  //creates a new object with the word in the bar and the
  void _newWord() {
    practiceDeck.addWord(keyboardMonkey.text);
    //temp if statement that adds 3 words to the list for testing purposes
    if (hasntOccured) {
      practiceDeck.practiceWordGen();
      practiceDeck.pendingReviews[1].setInterval(3);
      practiceDeck.pendingReviews[2].setInterval(2);
      practiceDeck.reviewed(0);
      practiceDeck.reviewed(0);
      practiceDeck.reviewed(0);
      practiceDeck.reviewed(0);

      hasntOccured = false;
    }
    keyboardMonkey.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Current Word:',
            ),
            Text(
              '$_displayedWord',
              style: Theme.of(context).textTheme.headline6,
            ),
            // const TextField(
            //   onSubmitted: (String value) async {
            //     _newWord(value);
            //   }
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder();
            //     labelText: 'Add a Word';
            //   )
            // ),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'New Word',
              ),
              controller: keyboardMonkey,
            ),
            CheckReviewsButton(practiceDeck)
          ],
        ),
      ),
      //  elevatedButton: ElevatedButton(
      //   onPressed: _newWord,
      //   child: Text("Add a word"),
      // ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: _newWord,
            tooltip: 'Increment',
            child: const Icon(Icons.comment_rounded),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class CheckReviewsButton extends StatelessWidget {
  var theDeckToCheck;

  CheckReviewsButton(this.theDeckToCheck);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        theDeckToCheck.recentReviewsCheck();
      },
      //change this text it's bad and boring and doesnt convey the right messag
      child: const Text('Re-sort'),
    );
  }
}
