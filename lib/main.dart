import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';

import 'package:flutter_demo/models/words.dart';
import 'package:flutter_demo/common/ui.dart';
import 'package:flutter_demo/common/config.dart';

void main() => runApp(new MyAPP());

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return ChangeNotifierProvider(
      builder: (context) => new WordModel(),
      child: MaterialApp(
        title: 'hello app title',
        home: new RandomWords(),
        theme: new ThemeData(
          primaryColor: Colors.black,
        ),
        routes: routes,
      ),
    );
  }
}

class RandomWords extends StatelessWidget {
  void _goto(context, route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: new AppBar(
        title: Consumer<WordModel>(
          builder: (ctx, word, child) =>
              Text('${word.saved.length}/${word.length} '),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.favorite,
            ),
            onPressed: () => _goto(ctx, 'saved'),
          ),
          new IconButton(
            icon: new Icon(
              Icons.message,
            ),
            onPressed: () => _goto(ctx, 'test'),
          ),
          new IconButton(
            icon: new Icon(
              Icons.more_vert,
            ),
            onPressed: () => _goto(ctx, 'detail'),
          ),
        ],
      ),
      body: _buildSuggestions(ctx),
    );
  }

  Widget _buildSuggestions(BuildContext ctx) {
    final word = Provider.of<WordModel>(ctx, listen: false);
    return new ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (ctx, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
          word.addList(generateWordPairs().take(10).toList());
        if (index >= word.length) {
        }
        return _buildRow(word.all[index], index, ctx);
      },
    );
  }

  Widget _buildRow(WordPair pair, int index, BuildContext ctx) {
    return Consumer<WordModel>(
      builder: (context, word, child) {
        final saved = word.saved;
        final alreadySaved = saved.contains(pair);
        final icon = alreadySaved ? 'saved' : 'normal';

        return new ListTile(
          title: new Text(
            '${index + 1}. ${pair.asPascalCase}',
            style: larggerFont,
          ),
          trailing: iconMap[icon],
          onTap: () {
            word.toggleSaved(pair);
          },
        );
      },
    );
  }
}
