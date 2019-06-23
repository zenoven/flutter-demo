import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_demo/screens/detail.dart';
import 'package:flutter_demo/screens/saved.dart';
import 'package:flutter_demo/screens/test.dart';

Map<String, WidgetBuilder> getRoutes(Set<WordPair> saved) {
  return {
    'saved': (buildContext) => new Saved(
          saved,
        ),
    'detail': (buildContext) => new Detail(),
    'test': (buildContext) => new Test(),
  };
}
