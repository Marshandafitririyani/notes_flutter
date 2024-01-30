import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'note/note.dart';
import 'note/note_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Note])
abstract class AppDatabase extends FloorDatabase{
  NoteDao get noteDao;

  static Future<AppDatabase> init() async {
    AppDatabase instance = await $FloorAppDatabase.databaseBuilder('note_flutter.db').build();
    return instance;
  }
}