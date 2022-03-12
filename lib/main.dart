import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:developer' as developper;
import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo ホームページ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var logger = Logger();

  void _incrementCounter() {
    setState(() {
      _counter++;
      developper.log("dart:developer でのlog counter++されました");
      logger.v("logger でのlog counter++されました");
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <widget>[
        //     Expanded(child: Text("くま--"),),
        //     Expanded(child: Image.network('https://colopl.co.jp/assets/img/kuma/kv-kuma-chara.png'),),
        //   ],
        // ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //     Text("某企業のくま");
        //
        // )
      ],




      ),
    );  }
}
