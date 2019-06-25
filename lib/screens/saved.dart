import 'package:flutter/material.dart';
import 'package:flutter_demo/models/words.dart';
import 'package:provider/provider.dart';

import 'package:flutter_demo/common/ui.dart';

class Saved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WordModel>(
      builder: (context, word, child) {
        final saved = word.saved;
        final tiles = saved.toList().map((pair) {
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: larggerFont,
            ),
          );
        });
        print(tiles);
        final divided = ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList();
        return new Scaffold(
          appBar: new AppBar(title: new Text('Saved Words')),
          body: new ListView(
            children: divided,
          ),
        );
      },
    );
  }
}
