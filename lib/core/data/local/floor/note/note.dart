import 'package:floor/floor.dart';
import 'package:intl/intl.dart';

@Entity()
class Note {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String photo;
  String title;
  String content;
  String date;

  Note(this.id, this.photo, this.title, this.content, this.date);

  String dateTimeFormated() {
    // DateTime.fromMillisecondsSinceEpoch(0)
    DateTime dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
    DateFormat dateFormat = DateFormat('d MMMM yyyy, HH:mm');
    return dateFormat.format(dateTime);
  }
}
