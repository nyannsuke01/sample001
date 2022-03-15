import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('GridView'),
      ),
        body: GridView.count(
            crossAxisCount: 3,crossAxisSpacing: 10,
        )
    );
  }
}