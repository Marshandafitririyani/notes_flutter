import 'package:floor/floor.dart';

import 'note.dart';

@dao
abstract class NoteDao{
  @Query('SELECT * FROM Note')
  Stream<List<Note>> findAllNote();

  @Query('DELETE FROM Note WHERE id = :id')
  Future<Note?> delete(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> save(Note note);
}