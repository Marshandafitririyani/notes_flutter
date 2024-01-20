
import 'package:flutter/material.dart';
import 'package:notes_flutter/ui/add/screen/add_screen.dart';
import 'package:notes_flutter/ui/detail/screen/detail_note_screen.dart';

import '../../../model/note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Note> notes = [
    Note('images/img_logo_home.png',
        'Create First Android App', 'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement There will be a choice to select what kind of notes that user needed, so the experience while taking notes can be unique based on the needs. Create a mobile app UI Kit that provide a basic notes functionality but with some improvement'
        , '20 januari 2023', '15.02'),
    Note('images/img_logo_home.png', 'Create First Android App', 'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement.', '20 januari 2024', '15.02'),
    Note('images/img_logo_home.png', 'Create First Android App', 'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement.', '20 januari 2024', '15.02'),
    Note('images/img_logo_home.png', 'Create First Android App', 'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement There will be a choice to select what kind of notes that user needed, so the experience while taking notes can be unique based on the needs.', '20 januari 2023', '15.02'),
    Note('images/img_logo_home.png', 'Create First Android App', 'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement.', '20 januari 2024', '15.02'),
    Note('images/img_logo_home.png', 'Create First Android App', 'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement.', '20 januari 2024', '15.02'),
    Note('images/img_logo_home.png', 'Create First Android App', 'Create a mobile app UI Kit that provide a basic notes functionality but with some improvement There will be a choice to select what kind of notes that user needed, so the experience while taking notes can be unique based on the needs.', '20 januari 2023', '15.02'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: Colors.deepPurple,

              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                     // margin: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16 ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Amazing Journey', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),),
                            Text('What’s your story today?' ,style: TextStyle(color: Color(0xFFEFE9F7), fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                    Image.asset('assets/images/img_logo_home.png')
                  ],

                ),
              ),
            ),

            notesDetail(notes)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddScreen(action: 'add');
          }));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  notesDetail(List<Note> notes) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1/2,


          children: notes.map((note) =>
              Container(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return AddScreen(action: 'detail', note: note,);}));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                              children:[
                                Text(note.title, style: TextStyle(color: Color(0xFF180E25), fontSize: 16, fontWeight: FontWeight.w500),),
                                // Text(note.title, style: TextStyle(color: Color(0xFF180E25), fontSize: 10, fontWeight: FontWeight.w400,),),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: RichText(

                                    maxLines: 8,
                                    overflow: TextOverflow.ellipsis, // TextOverflow.clip // TextOverflow.fade
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: note.content, style: TextStyle(color: Color(0xFF180E25), fontSize: 10, fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                ),

                              ]
                          ),
                        ),
                        Container(
                            alignment: Alignment.bottomLeft,
                            width: double.infinity,
                            height: 34,
                            padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                            color: Color(0xFFEFEEF0),
                            child: Text(note.date, style: TextStyle(fontSize: 10),))
                      ],
                    ),
                  ),
                ),
              )

          ).toList(),
        ),
      ),
    );

  }

}


