import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favourite = <WordPair>[];

  void toggleFavourite() {
    if (favourite.contains(current)) {
      favourite.remove(current);
    } else {
      favourite.add(current);
    }
    notifyListeners();
  }
}