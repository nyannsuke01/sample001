import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:developer' as developper;
import 'package:logger/logger.dart';
import 'package:sample001/grid_view.dart';
import 'package:sample001/list_view.dart';

void main() {
  runApp(MaterialApp(home: Menu()));
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('menu'),
      ),
      body: Row(
        children: [
          TextButton(
            child: Text('ListView'),
            onPressed: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewPage())
              );
              debugPrint(result.toString());
            },
          ),
          TextButton(
            child: Text('GridView'),
            onPressed: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridViewPage())
              );
              debugPrint(result.toString());
            },
          ),
        ],
      )
    );
  }
}
