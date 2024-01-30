import 'package:get/get.dart';
import 'package:notes_flutter/core/data/local/floor/note/note_dao.dart';
import 'package:notes_flutter/ui/home/home_view_model.dart';

import '../../core/data/local/floor/note/note.dart';

class AddViewModel extends GetxController{
  /*final noteSample = Note(
      'images/img_logo_home.png',
      'Create First Android App',
      'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement.',
      '2024-01-14 12:23:08');*/

 final NoteDao _noteDao = Get.find();

 addNote (Note note){
   _noteDao.save(note);
 }

 deleteNote(int?  id){
   if (id == null) return;
   _noteDao.delete(id);
 }

}