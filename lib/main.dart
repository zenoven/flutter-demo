import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_demo/detail.dart';
import 'package:flutter_demo/saved.dart';

final _iconMap = {
  'saved': new Icon(
    Icons.favorite,
    color: Colors.red,
  ),
  'normal': new Icon(
    Icons.favorite,
  ),
};

void main() => runApp(new MyAPP());

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'hello app title',
      home: new RandomWords(),
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
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

  final _saved = new Set<WordPair>();

  void _toggleSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Saved(_saved, _larggerFont);
    }));
  }

  void _toggleDetail() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Detail();
    }));
  }

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('hello inner title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.favorite,
            ),
            onPressed: _toggleSaved,
          ),
          new IconButton(
            icon: new Icon(
              Icons.more_vert,
            ),
            onPressed: _toggleDetail,
          ),
        ],
      ),
      body: _buildSuggestions(ctx),
    );
  }

  Widget _buildSuggestions(BuildContext ctx) {
    return new ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (ctx, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _wordList.length) {
          _wordList.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_wordList[index], index, ctx);
      },
    );
  }

  Widget _buildRow(WordPair pair, int index, BuildContext ctx) {
    final alreadySaved = _saved.contains(pair);
    final icon = alreadySaved ? 'saved' : 'normal';

    return new ListTile(
      title: new Text(
        '${index + 1}. ${pair.asPascalCase}',
        style: _larggerFont,
      ),
      trailing: _iconMap[icon],
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
