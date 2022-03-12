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
      debugShowCheckedModeBanner: false,
      home: MyWigget(),
    );
  }
}

class MyWigget extends StatefulWidget {


  @override
  State<MyWigget> createState() => _MyWiggetState();
}

class _MyWiggetState extends State<MyWigget> {

  late Color color;
  late double borderRadius;
  late double boxSize;

  @override
  void initState() {
    super.initState();
    color = Colors.black;
    borderRadius = 16.0;
    boxSize = 200.0;
  }

  var logger = Logger();

  void change() {
    //状態を変化させてUIに反映させる
    setState(() {
      color = Colors.blueGrey;
      borderRadius = 16.0 * 5;
      boxSize = 300.0;
      logger.v("Change()が呼ばれました。");
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Animation'),
        ),

        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AnimatedContainer(
                  width: boxSize,
                  height: boxSize,
                  margin: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: const Duration(milliseconds: 1000),
                ),
              ),
              ElevatedButton(
                child: const Text('start'),
                onPressed: () => change(),
              ),
            ],
          ),

        )
    );
  }
}
