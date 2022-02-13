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
  var _displayedWord = "";
  int runningThrough = 0;

  //declerations

  List srsList = [
    VocabWord("monkey", DateTime.now()),
    VocabWord("cookie", DateTime.now()),
    VocabWord("testCase", DateTime.now())
  ];
  //creates a text editing controller that allows us to handle inputs from users and assign new words
  TextEditingController keyboardMonkey = TextEditingController();

  void _incrementCounter() {
    setState(() {
      if (runningThrough < srsList.length - 1) {
        runningThrough++;
      }
      _displayedWord = srsList[runningThrough].word;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (runningThrough > 0) {
        runningThrough--;
      }
      _displayedWord = srsList[runningThrough].word;
    });
  }

  //creates a new object with the word in the bar and the
  void _newWord() {
    srsList.add(VocabWord(keyboardMonkey.text, DateTime.now()));
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
            )
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
