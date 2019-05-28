import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyAPP);

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    final wordPair = new WordPair.random();
    return MaterialApp(
      title: 'hello app title',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('hello appbar title'),
        ),
        body: new Center(
          child: new Text(wordPair.asPascalCase),
        )
      )
    );
  }
}
