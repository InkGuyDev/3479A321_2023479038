import 'dart:async';

import 'package:application_laboratorio/entity/activity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();
  Future<void> initializeDatabase() async {
    await database;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'activity_database.db');
    return await openDatabase(path, version: 1, onCreate: onCreate);
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE [Activity] (
    [id] INTEGER PRIMARY KEY,
    [fecha] TEXT NOT NULL,
    [nombre] TEXT NOT NULL
    )
     ''');
  }

  Future<void> insertActivity(Activity activity) async {
    final db = await database;
    await db.insert(
      'Activity',
      activity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateActivity(Activity act) async {
    final db = await database;

    await db.update(
      'Activity',
      act.toMap(),
      
      where: 'id = ?',
      
      whereArgs: [act.id],
    );
  }

  Future<void> deleteActivity(int id) async {
    final db = await database;

    await db.delete(
      'Activity',
      
      where: 'id = ?',
      
      whereArgs: [id],
    );
  }

  Future<List<Activity>> recoverActivities() async {
    final db = await database;

    final List<Map<String, Object?>> actMaps = await db.query('Activity');

    return [
      for (final Map<String, Object?> map in actMaps) Activity.fromMap(map),
    ];
  }
}
