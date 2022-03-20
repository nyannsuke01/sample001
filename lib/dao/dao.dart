import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/memo.dart';

//Create
Future <Database> initialized() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE memo(id INTEGER PRIMARY KEY, title TEXT, contents INTEGER)",

      );
    },
    version: 1,
  );
  return database;
}

//update
Future <void> updateMemo(Database db, Memo memo) async {
  await db.update(
    'memo',
    memo.toMap(),
    where: "id = ?",
    whereArgs: [memo.id],
  );
}

//delete
Future <void> deleteMemo(Database db, int id) async {
  await db.delete(
    'memo',
    where: "id = ?",
    whereArgs: [id],
  );
}

//delete
Future <List<Memo>> selectMemoById(Database db, int id) async {
  final List<Map<String, dynamic>> data = await db.query('memo',
    where: 'id = ?',
    whereArgs: [id]
  );
  return List.generate(data.length, (i) {
    return Memo(
        id: data[i]['id'],
        title: data[i]['title'],
        contents: data[i]['contents'],
    );
  });
}
