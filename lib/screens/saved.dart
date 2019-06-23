import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'package:flutter_demo/common/ui.dart';

class Saved extends StatelessWidget {
  final Set<WordPair> saved;

  Saved(this.saved);

  @override
  Widget build(BuildContext context) {
    final tiles = saved.map((pair) {
      return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: larggerFont,
        ),
      );
    });
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
  }
}
