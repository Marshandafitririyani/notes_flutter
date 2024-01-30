import 'package:get/get.dart';
import 'package:notes_flutter/core/data/local/floor/note/note_dao.dart';


class HomeViewModel extends GetxController {

  HomeViewModel(){
    _noteDao.findAllNote().listen((notesDb) {
      notes = notesDb;
      update();
    });
  }

  final NoteDao _noteDao = Get.find();
  var notes = List.empty();


}

