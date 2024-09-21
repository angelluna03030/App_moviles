/*import "package:sqflite/sqflite.dart";

import "animal.dart";

import "package:path/path.dart";

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), '.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE Libros (id INTEGER PRIMARY KEY, titulo TEXT, descripcion TEXT,fechaPublicacion TEXT, precio TEXT )");
    }, version: 1);
  }

  static Future<int> insert(Bookstore libro) async {
    Database database = await _openDB();
    return database.insert("animales", libro.toMap());
  }

  static Future<int> delete(Animal animal) async {
    Database database = await _openDB();
    return database.delete("animales", where: "id = ?", whereArgs: [animal.id]);
  }

  static Future<int> update(Animal animal) async {
    Database database = await _openDB();
    return database.update("animales", animal.toMap(),
        where: "id = ?", whereArgs: [animal.id]);
  }

  static Future<List<Animal>> getAllAnimals() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> animalesMap =
        await database.query("animales");
    return List.generate(
      animalesMap.length,
      (i) => Animal(
        id: animalesMap[i]["id"],
        nombre: animalesMap[i]["nombre"],
        especie: animalesMap[i]["especie"],
      ),
    );
  }
  static Future<void> insert2(Animal animal) async {
    Database database = await _openDB();
    var resultado = await database.rawInsert(
        "INSERT INTO animales (id, nombre, espcie) VALUES (${animal.id}, ${animal.nombre}, ${animal.especie})");
}
}
*/