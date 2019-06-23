import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_demo/common/ui.dart';
import 'package:flutter_demo/common/config.dart';

final _saved = new Set<WordPair>();

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
      routes: getRoutes(_saved),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _wordList = <WordPair>[];

  void _goto(route) {
    Navigator.of(context).pushNamed(route);
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
            onPressed: () => _goto('saved'),
          ),
          new IconButton(
            icon: new Icon(
              Icons.message,
            ),
            onPressed: () => _goto('test'),
          ),
          new IconButton(
            icon: new Icon(
              Icons.more_vert,
            ),
            onPressed: () => _goto('detail'),
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
        style: larggerFont,
      ),
      trailing: iconMap[icon],
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
