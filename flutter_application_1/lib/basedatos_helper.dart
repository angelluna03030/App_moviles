





// import "package:sqflite/sqflite.dart";
// import "package:path/path.dart";
// class BasedatosHelper {
//   var path = null;
//   Future<Database> _opendatabase() async {
//     final databasepath = await getDatabasesPath();
//     path = join(databasepath, 'mydatabase.db');

//     return openDatabase(
//       path,
//       onCreate: (db, version) async {
//         await db.execute(
//             'CREATE TABLE mitabla (id INTEGER PRIMARY KEY, name TEXT');
//       },
//       version: 1,
//     );
//   }

//   Future<void> addData() async {
//     final database = await _opendatabase();
//     await database.insert('mitabla', {'name': 'juan'},
//         conflictAlgorithm: ConflictAlgorithm.replace);
//     print("agregado");
//     await database.close();
//   }

//   Future<void> mostra() async {
//     final database = await _opendatabase();
//     final data = await database.query('mitabla');
//     print(data.toString());
//     await database.close();
//   }
// }