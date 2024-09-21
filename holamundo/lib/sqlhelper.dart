import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {

  
static Future<void> createTables(sql.Database database) async {
   // var tablas = {
          // "CREATE TABLE canciones(nombre TEXT);",
          //"CREATE TABLE usuarios(id INT);",
            
   // };
    //for (String tabla in tablas) {
      // await database.execute(tabla);
    //}

    await database.execute("""CREATE TABLE Libros(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
           fechapublicacion TEXT,
             precio TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'kindacode.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String title, String? descrption,String? fechapublicacion, String? precio) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'description': descrption, 'fechapublicacion' : fechapublicacion, "precio": precio};
    final id = await db.insert('Libros', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('Libros', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('Libros', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String title, String? descrption, String? fechapublicacion, String? precio) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': descrption,
       'fechapublicacion' : fechapublicacion,
        "precio": precio,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('Libros', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("Libros", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}