// import 'dart:async';
// import 'dart:io';

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/widgets.dart';

// class MyDB {
//   MyDB._();

//   static final MyDB db = MyDB._();

//   Database _database;

//   Future<Database> get database async {
//     if (_database != null) return _database;
//     // if _database is null we instantiate it
//     _database = await initDB();
//     return _database;
//   }

//   initDB() async {
//     return await openDatabase(
//       // Set the path to the database. Note: Using the `join` function from the
//       // `path` package is best practice to ensure the path is correctly
//       // constructed for each platform.
//       join(await getDatabasesPath(), 'Database.db'),
//       // When the database is first created, create a table to store dogs.
//       onCreate: (db, version) async {
//         // Run the CREATE TABLE statement on the database.
//         await db.execute(
//           'CREATE TABLE focus(id INTEGER PRIMARY KEY, name TEXT, time INTEGER)',
//         );
//       },
//       // Set the version. This executes the onCreate function and provides a
//       // path to perform database upgrades and downgrades.
//       version: 1,
//     );

//     insertFocus(int time) async {
//       // Get a reference to the database.
//       final db = await database;
//       Map<String, dynamic> map = {'id': 1, 'name': "Focus Time", 'time': time};

//       // Insert the Dog into the correct table. You might also specify the
//       // `conflictAlgorithm` to use in case the same dog is inserted twice.
//       //
//       // In this case, replace any previous data.
//       await db.insert(
//         'focus',
//         map,
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }

//     Future<void> updateFocus(int time) async {
//       // Get a reference to the database.
//       final db = await database;
//       Map<String, dynamic> map = {'id': 1, 'name': "Focus Time", 'time': time};

//       // Update the given Dog.
//       await db.update(
//         'focus',
//         map,
//         // Ensure that the Dog has a matching id.
//         where: 'id = 1',
//         // Pass the Dog's id as a whereArg to prevent SQL injection.
//         whereArgs: [map['id']],
//       );
//     }

//     Future<int> focus() async {
//       // Get a reference to the database.
//       final db = await database;

//       // Query the table for all The Dogs.
//       final List<Map<String, dynamic>> maps = await db.query('focus');

//       // Convert the List<Map<String, dynamic> into a List<Dog>.
//       return maps[0]['time'];
//     }
//   }
// }

// // class DBProvider {
// //   DBProvider._();
// //   static final DBProvider db = DBProvider._();

// //   static Database _database;

// //   Future<Database> get database async {
// //     if (_database != null) return _database;

// //     // if _database is null we instantiate it
// //     _database = await initDB();
// //     return _database;
// //   }

// //   initDB() async {
// //     Directory documentsDirectory = await getApplicationDocumentsDirectory();
// //     String path = join(documentsDirectory.path, "TestDB.db");
// //     return await openDatabase(path, version: 1, onOpen: (db) {},
// //         onCreate: (Database db, int version) async {
// //       await db.execute("CREATE TABLE Client ("
// //           "id INTEGER PRIMARY KEY,"
// //           "first_name TEXT,"
// //           "last_name TEXT,"
// //           "blocked BIT"
// //           ")");
// //     });
// //   }
// // }


