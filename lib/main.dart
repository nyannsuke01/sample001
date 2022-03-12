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

    List<Widget> images = [
      Image.network('https://colopl.co.jp/assets/img/kuma/kv-kuma-chara.png'),
      Image.network('http://j.people.com.cn/NMediaFile/2015/0413/FOREIGN201504131605000450602809121.jpg'),
      Image.network('https://2.bp.blogspot.com/-DDtL958qAjs/VHPgLGRNi2I/AAAAAAAApPU/oXTPlRulaEk/s400/pet_dog_sleep.png'),
      Image.network('https://colopl.co.jp/assets/img/kuma/kv-kuma-chara.png'),
      Image.network('http://j.people.com.cn/NMediaFile/2015/0413/FOREIGN201504131605000450602809121.jpg'),
      Image.network('https://2.bp.blogspot.com/-DDtL958qAjs/VHPgLGRNi2I/AAAAAAAApPU/oXTPlRulaEk/s400/pet_dog_sleep.png'),
      Image.network('https://colopl.co.jp/assets/img/kuma/kv-kuma-chara.png'),
      Image.network('http://j.people.com.cn/NMediaFile/2015/0413/FOREIGN201504131605000450602809121.jpg'),
      Image.network('https://2.bp.blogspot.com/-DDtL958qAjs/VHPgLGRNi2I/AAAAAAAApPU/oXTPlRulaEk/s400/pet_dog_sleep.png')


    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: GridView.count(
          crossAxisCount: 3,crossAxisSpacing: 10,
          children: images
      )

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
    );
    }
}
