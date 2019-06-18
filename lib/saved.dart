import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Saved extends StatelessWidget {
  final Set<WordPair> saved;
  final TextStyle style;

  Saved(this.saved, this.style);

  @override
  Widget build(BuildContext context) {
    final tiles = saved.map((pair) {
      return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: style,
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
