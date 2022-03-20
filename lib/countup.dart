import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CounterStore(),
        child: MaterialApp(
            title: 'Flutter Practice1',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage()));
  }
}

class CounterStore with ChangeNotifier {
  var counter = 0;

  void incrementCounter() {
    counter++;

    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CounterStore>();
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulWidget'),
      ),
      body: Center(
          child: Column(
              children:[
                Text(store.counter.toString()),


                TextButton(
                    child: Text('画面遷移'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyHomePage()));
                    })])),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<CounterStore>().incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}