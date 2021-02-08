import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:qrapp/models/scan_model.dart';
export 'package:qrapp/models/scan_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    //path de donde esta la bd en el cel
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "ScansDB.db");
    print(path);
    //crear DB
    //siempre actualizar la vrsion cuando le muevasa las tablas, etc-
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
         ''');
    });
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    //verificar la BD
    final db = await database;
    final resp = await db.rawInsert('''
    INSERT INTO Scans(id,tipo,valor) VALUES($id,'$tipo','$valor');
  ''');

    return resp;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final resp = await db.insert("Scans", nuevoScan.toJson());
    print(resp);
    //es el ID del ultimo registro insertado
    return resp;
  }

  Future<ScanModel> getScanByID(int id) async {
    final db = await database;
    final resp = await db.query("Scans", where: "id = ?", whereArgs: [id]);
    print(resp.first);
    return resp.isNotEmpty ? ScanModel.fromJson(resp.first) : null;
  }

  Future<List<ScanModel>> getTodosScans() async {
    final db = await database;
    final resp = await db.query("Scans");
    print(resp.first);
    return resp.isNotEmpty
        ? resp.map((s) => ScanModel.fromJson(s)).toList()
        : [];
  }

  Future<List<ScanModel>> getScanByTipo(String tipo) async {
    final db = await database;
    final resp = await db.rawQuery(''' 
      SELECT * FROM Scans WHERE tipo = "$tipo";
    
    ''');
    print(resp.first);
    return resp.isNotEmpty
        ? resp.map((s) => ScanModel.fromJson(s)).toList()
        : [];
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final resp = db.update("Scans", nuevoScan.toJson(),
        where: "id =?", whereArgs: [nuevoScan.id]);
    return resp;
  }

  Future<int> borraUno(int id) async {
    final db = await database;
    final resp = db.delete("Scans", where: "id=?", whereArgs: [id]);
    return resp;
  }

  Future<int> borrarTodo() async {
    final db = await database;
    //final resp = db.delete("Scans"); esta es de maenra mas rapido
    final resp = db.rawDelete(''' 
    DELETE FROM Scans
    ''');
    return resp;
  }
}
