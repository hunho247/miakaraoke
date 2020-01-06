import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'SoundRecording.dart';

class RecordingHelper {
  final String tableName = "soundrecording.db";
  Database _database;

  RecordingHelper() {
    database;
  }

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<String> get _localPath async {
    final Directory directory = await getExternalStorageDirectory();
    return directory.path;
  }

  Future<void> _createDirectory() async {
    final String path = await _localPath;
    if (!Directory('$path/KaraRecording').existsSync()) {
      final Directory directory = await Directory('$path/KaraRecording').create(recursive: true);
      print("The directory $directory is created");
    }
  }

  initDB() async {
    _createDirectory();
    return await openDatabase(
      join(await getDatabasesPath(), tableName),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE recordings(id INTEGER PRIMARY KEY, name TEXT, path TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertRecording(SoundRecording recording) async {
    final Database db = await database;

    await db.insert(
      'recordings',
      recording.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<SoundRecording>> recordings() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('recordings');

    return List.generate(maps.length, (i) {
      return SoundRecording(
        id: maps[i]['id'],
        name: maps[i]['name'],
        path: maps[i]['path'],
      );
    });
  }

  Future<void> updateRecording(SoundRecording recording) async {
    final db = await database;

    await db.update(
      'recordings',
      recording.toMap(),
      where: "id = ?",
      whereArgs: [recording.id],
    );
  }

  Future<void> deleteRecording(int id) async {
    final db = await database;

    await db.delete(
      'recordings',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
