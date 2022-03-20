import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            title: 'Flutter Practice1',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage()

    );
  }
}

final counterProvider = ChangeNotifierProvider((ref) => CounterStore());
class CounterStore extends ChangeNotifier {
  var counter = 0;
  var list = <String>[];

  void incrementCounter() {
    counter++;

    notifyListeners();
  }

  void removeAt(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final count = counter.
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