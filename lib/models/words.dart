import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class WordModel extends ChangeNotifier {
  final all = new List<WordPair>();
  Set<WordPair> _saved = new Set<WordPair>();

  get saved {
    return _saved;
  }

  set saved(Set<WordPair> newSaved) {
    _saved = newSaved;
    notifyListeners();
  }

  void toggleSaved(WordPair word) {
    if (_saved.contains(word)) {
      _saved.remove(word);
    } else {
      _saved.add(word);
    }
    notifyListeners();
  }

  bool addWord(WordPair word, {bool needNotify: true}) {
    bool existed = all.contains(word);
    if (existed) return false;
    all.add(word);
    if (needNotify) {
      notifyListeners();
    }
    return true;
  }

  void addWordList(List<WordPair> wordList, {bool needNotify: true}) {
    all.addAll(wordList);
    notifyListeners();
  }
}
