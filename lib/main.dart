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
      builder: (context) => new WordModel(initialCount: 50),
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
    final word = Provider.of<WordModel>(ctx, listen: false);
    return new Scaffold(
      appBar: new AppBar(
        title: Consumer<WordModel>(
          builder: (ctx, word, child) =>
              Text('${word.saved.length}/${word.length}'),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.add_circle,
            ),
            onPressed: () => word.add(generateWordPairs().take(1).toList()[0]),
          ),
          new IconButton(
            icon: new Icon(
              Icons.library_add,
            ),
            onPressed: () =>
                word.addList(generateWordPairs().take(10).toList()),
          ),
          new IconButton(
            icon: new Icon(
              Icons.favorite,
            ),
            onPressed: () => _goto(ctx, 'saved'),
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
    final word = Provider.of<WordModel>(ctx);
    return new NotificationListener(
      onNotification: (ScrollNotification notice) {
        if (notice.metrics.extentAfter <= 200) {
          word.addList(generateWordPairs().take(30).toList());
        }
        return;
      },
      child: new ListView.separated(
        separatorBuilder: (BuildContext ctx, int count) {
          return new Divider();
        },
        padding: const EdgeInsets.all(20.0),
        itemCount: word.length,
        itemBuilder: _buildRow,
      ),
    );
  }

  Widget _buildRow(BuildContext ctx, int index) {
    final word = Provider.of<WordModel>(ctx, listen: false);
    final saved = word.saved;
    final pair = word.all[index];
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
  }
}
