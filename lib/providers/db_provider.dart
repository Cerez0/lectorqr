

import 'dart:io';

import 'package:codigosqr/models/scan_model.dart';
export 'package:codigosqr/models/scan_model.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future <Database> get database async {
    
    if (_database != null){
      return _database;
    }else{
      _database = await initDB();
      return _database;
    }
  }

  Future<Database> initDB() async{
    //path de donde almacenaremos la base de datos
    
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    //Crear Base de datos
    
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''

          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
          
        ''');
      }
    );
    
  }

  Future <int> nuevoScan(ScanModel nuevoScan) async {

    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());

    return res;

  }

  Future <ScanModel> getScanById(int id) async {

    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
        ? ScanModel.fromJson(res.first)
        : null;
  }
}