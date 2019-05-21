import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      print(context);
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    final useless = ['b', 'c'];

    Map<String, int> testMap = {
      'a': 1,
      'b': 2,
      'c': 3,
      'd': 4,
    };

    bool _useLess(String key, int value) {
      return useless.contains(key);
    }

    testMap.removeWhere(_useLess);

    print('keys: ${testMap.keys.join(',')}');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(wordPair.asPascalCase),
            Text(testMap.hashCode.toString()),
            Text(testMap.keys.join(',')),
            Text(testMap.remove('a').toString()),
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.account_circle),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
