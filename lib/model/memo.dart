import 'package:flutter_riverpod/flutter_riverpod.dart';

class Memo {
  final int id;
  final String title;
  final String contents;
  Memo({required this.id, required this.title, required this.contents});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'contents': contents,
    };
  }
  @override
  String toString() {
    return 'Memo{id: $id, title: $title, contents: $contents}';
  }
}