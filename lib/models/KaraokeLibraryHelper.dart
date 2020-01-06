import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'KaraokeSong.dart';

class KaraokeLibraryHelper {
  final String tableName = "asset_karaokevn.db";
  Database _database;

  PlaylistHelper() {
    database;
  }

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    // Construct a file path to copy database to
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, tableName);

    File f = new File(path);
    bool exists = f.existsSync();

    // Only copy if the database doesn't exist
    if (!exists) {
      // Load database from asset and copy
      ByteData data = await rootBundle.load(join('assets', 'karaokevn.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await new File(path).writeAsBytes(bytes);
    }

    return await openDatabase(path, version: 1, onOpen: (db) {});
  }

  markLikedKaraoke(int id, int fav) async {
    final db = await database;
    await db.rawQuery("UPDATE song SET favorite = '" +
        fav.toString() +
        "' WHERE ID = '" +
        id.toString() +
        "'");
  }

  getKaraokes() async {
    final db = await database;
    var res = await db.rawQuery("SELECT * FROM song");
    List<KaraokeSong> list =
        res.isNotEmpty ? res.map((c) => KaraokeSong.fromMap(c)).toList() : [];
    return list;
  }

  getLimitedKaraokeList(int present, int perPage) async {
    final db = await database;
    var res = await db.rawQuery("SELECT * FROM song LIMIT " +
        present.toString() +
        "," +
        perPage.toString());
    List<KaraokeSong> list =
        res.isNotEmpty ? res.map((c) => KaraokeSong.fromMap(c)).toList() : [];
    return list;
  }

  searchKaraokes(String karaoke) async {
    final db = await database;
    var res = await db.rawQuery(
        "SELECT * FROM song WHERE title_simple LIKE '%" + karaoke + "%' ");
    List<KaraokeSong> list;

    if (res.isNotEmpty) {
      list = res.map((c) => KaraokeSong.fromMap(c)).toList();
    } else {
      res = await db.rawQuery(
          "SELECT * FROM song WHERE title_short LIKE '" + karaoke + "%' ");

      if (res.isNotEmpty) {
        list = res.map((c) => KaraokeSong.fromMap(c)).toList();
      } else {
        res = await db.rawQuery(
            "SELECT * FROM song WHERE title LIKE '" + karaoke + "%' ");

        list = res.isNotEmpty
            ? res.map((c) => KaraokeSong.fromMap(c)).toList()
            : [];
      }
    }

    return list;
  }

  toMap(KaraokeSong s) {
    return {
      'id': s.id,
      'code': s.code,
      'title': s.title,
      'title_simple': s.title_simple,
      'title_short': s.title_short,
      'lyric': s.lyric,
      'lyric_simple': s.lyric_simple,
      'brand_id': s.brand_id,
      'brand_text': s.brand_text,
      'vol': s.vol,
      'lang': s.lang,
      'author': s.author,
      'favorite': s.favorite,
      'author_simple': s.author_simple,
      'artist': s.artist,
      'artist_simple': s.artist_simple,
    };
  }
}