import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  int _selectedIndex = 0;
  const ListViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int itemCount = 10;
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: itemCount > 0 ? ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            selected: index == _selectedIndex,

          );
        }
      )
    );
  }
}