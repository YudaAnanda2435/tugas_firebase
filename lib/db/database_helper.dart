import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'titipan.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE titipan(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        hpEmail TEXT,
        jumlahHari INTEGER,
        jenisKucing TEXT
      )
      ''');
  }

  Future<int> insertData(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('titipan', data);
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await database;
    return await db.query('titipan');
  }

  Future<int> deleteData(int id) async {
    final db = await database;
    return await db.delete(
      'titipan',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
