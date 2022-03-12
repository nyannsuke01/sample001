import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:developer' as developper;
import 'package:logger/logger.dart';

void main() {
  runApp(MaterialApp(home: FirstScreen()));
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('最初の画面'),
      ),
      body: Center(
        child: TextButton(
            child: Text('次の画面に遷移'),
            onPressed: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen())
              );
              debugPrint(result.toString());
            },
        ),
      ),

    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  return Scaffold(

    appBar: AppBar(
      title: Text('2番目の画面'),
    ),
    body: Center(
      child: TextButton(
        child: Text('前の画面に遷移'),
          onPressed: () {
          var returnValues = RetunValues('戻る時のデータ');
          Navigator.pop(context, returnValues);
          }),
    ),
  );
  }
}

class RetunValues {
  String message;
  RetunValues(this.message);

  @override
  String toString() {
    return 'message: ${message}';
  }
}
