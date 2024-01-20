import 'package:flutter/material.dart';
import 'package:notes_flutter/model/note.dart';

class DetailNoteScreen extends StatefulWidget {
  const DetailNoteScreen({super.key, required this.notes});

  final Note notes;

  @override
  State<DetailNoteScreen> createState() => _DetailNoteScreenState();
}

class _DetailNoteScreenState extends State<DetailNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Icon(Icons.arrow_back),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                AlertDialog alert = AlertDialog(
                  title: Text("Save",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF180E25),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center),
                  content: Text(
                    "Are you sure you want to save this note?",
                    style: TextStyle(
                        color: Color(0xFF827D89),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  actions: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                  color: Colors.deepPurple,
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    'Cancle',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )),
                        Container(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Container(
                                    color: Colors.deepPurple,
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      'Save',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )),
                        ),
                      ],
                    )
                  ],
                );

                // show the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
              child: Icon(
                Icons.check_circle_outline,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  height: 1,
                  color: Color(0xFFEFEEF0),
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: new InputDecoration.collapsed(
                      hintStyle: TextStyle(color: Color(0XFFC8C5CB)), hintText: "Title"),
                  style: TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.w700),
                  initialValue: widget.notes.title,
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: new InputDecoration.collapsed(
                        hintStyle: TextStyle(fontSize: 16, color: Color(0XFFC8C5CB), fontWeight: FontWeight.w400), hintText: "Content"),
                    initialValue: widget.notes.content,

                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 24),
                  height: 1,
                  color: Color(0xFFEFEEF0),
                ),
                Row(
                  children: [
                    Text('18/01/2024,'),
                    Container(
                        margin: EdgeInsets.only(left: 5), child: Text('09.24')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final snackBar = SnackBar(
  content: const Text('Logout Succes'),
);
