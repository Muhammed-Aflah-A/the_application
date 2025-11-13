// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:the_app/service/service_confiq.dart';

// class SqfliteDb implements ServiceLayer {
//   static Database? _sqfliteDb;
//   Future<Database> get sqfliteDb async {
//     if (_sqfliteDb != null) return _sqfliteDb!;
//     _sqfliteDb = await initDb();
//     return _sqfliteDb!;
//   }

//   Future<Database> initDb() async {
//     final dataBasePath = await getDatabasesPath();
//     final path = join(dataBasePath, 'sqFlite_user.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute(
//           '''CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT,username TEXT UNIQUE NOT NULL,gmail TEXT UNIQUE NOT NULL,password TEXT NOT NULL)''',
//         );
//       },
//     );
//   }

//   @override
//   Future<void> addUser(Sqflite user) async {
//     final db = await sqfliteDb;
//     await db.insert('users', user.toMap());
//   }
// }
