import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyAPP());

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'hello app title',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _wordList = <WordPair>[];

  final _larggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildWordList() {
    return new ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemBuilder: (ctx, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _wordList.length) {
            _wordList.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_wordList[index], index);
        });
  }

  Widget _buildRow(WordPair pair, int index) {
    return new ListTile(
        title:
            new Text('${index + 1}. pair.asPascalCase', style: _larggerFont));
  }

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('hello inner title'),
        ),
        body: _buildWordList());
  }
}
