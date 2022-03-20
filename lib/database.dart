import 'package:flutter/material.dart';
import 'package:sample001/state/memo_state.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dao/dao.dart';
import 'model/memo.dart';
import 'state/memo_state.dart';

late Database _database;
late ChangeNotifierProvider<MemoState> memoProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _database = await initialized();

  var list = await selectMemoById(_database,1);
  var memo;
  if(list.isNotEmpty) {
    memo = list[0];
  } else {
    memo = Memo(id:1, title: '', contents: '');
  }
  memoProvider = ChangeNotifierProvider((ref) => memo);
  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            title: 'Flutter',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(),
    );
  }
}


class MyHomePage extends ConsumerWidget {
  late String title;
  late String contents;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final memo = ref.watch(memoProvider);
    title = memo.title;
    contents = memo.contents;
    const margine = EdgeInsets.all(8);

    return Scaffold(
      appBar: AppBar(
        title: Text("状態管理ありメモ"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: margine,
            child: TextField(
              controller: TextEditingController(text: title),
              onChanged: (text) => title = text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'タイトル',
              ),
            ),
          ),
          Container(
            margin: margine,
            child: TextField(
              controller: TextEditingController(text: contents),
              onChanged: (text) => contents = text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '本文',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var memo = Memo(id:1, title: title, contents: contents);
          await updateMemo(_database, memo);
        },
          tooltip: "保存",
          child: const Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
