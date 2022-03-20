import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final memoProvider = ChangeNotifierProvider((ref) => MemoState());

class MemoState extends ChangeNotifier {
  String title = '';
  String contents = '';
  void updateTitle (String titles) {
    this.title;
    notifyListeners();
  }
  void updateContents (String contents) {
    this.contents = contents;
    notifyListeners();
  }

}
