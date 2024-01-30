import 'package:get/get.dart';
import 'package:notes_flutter/core/data/local/floor/app_database.dart';

import '../data/local/floor/note/note.dart';

class AppModule {
  static Future<void> initService() async {
    await Get.putAsync(() => AppDatabase.init());
    //async menunggu
    Get.lazyPut(() => Get.find<AppDatabase>().noteDao);
    //lazyput dibuat ketika dipanggil (getfind)

    final noteSample = Note(
        9,
        'images/img_logo_home.png',
        'Create First Android App',
        'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement.',
        '2024-01-14 12:23:08');

    Get.put(() => noteSample);
    // put dibuat disini sudah ada
  }
}
