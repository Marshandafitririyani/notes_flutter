
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/note.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key, required this.action, this.note });

  final String action;

  final Note? note;


  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {


  @override
  Widget build(BuildContext context) {
    print('action berasal dari ${widget.action}');

    DateTime dateNow = DateTime.now();

    DateFormat dateFormat = DateFormat('d MMMM yyyy, HH:mm');
    String dateNowFormated = dateFormat.format(dateNow);
    // String dateNowFormated = '${dateNow.day} ${dateNow.month} ${dateNow.year}  ${dateNow.hour} ${dateNow.minute}';


    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       iconTheme: IconThemeData(color: Colors.black),
       leading: Icon(Icons.arrow_back),
       actions: [
         if (widget.action == 'add')...[
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

                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             },
                             child: ClipRRect(
                               borderRadius:  BorderRadius.circular(
                                   24
                               ),
                               child: Container(
                                   color: Colors.deepPurple,
                                   padding: EdgeInsets.all(16),
                                   child: Text('Cancle', style: TextStyle(color: Colors.white),)),
                             )),
                         Container(
                           child: TextButton(
                               onPressed: () {
                                 Navigator.pop(context);
                               },
                               child: ClipRRect(
                                 borderRadius:  BorderRadius.circular(
                                     24
                                 ),
                                 child: Container(
                                     color: Colors.deepPurple,
                                     padding: EdgeInsets.all(16),
                                     child: Text('Save', style: TextStyle(color: Colors.white),)),
                               )
                           ),
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

         ]else if (widget.action == 'detail')...[
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

                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             },
                             child: ClipRRect(
                               borderRadius:  BorderRadius.circular(
                                   24
                               ),
                               child: Container(
                                   color: Colors.deepPurple,
                                   padding: EdgeInsets.all(16),
                                   child: Text('Cancle', style: TextStyle(color: Colors.white),)),
                             )),
                         Container(
                           child: TextButton(
                               onPressed: () {
                                 Navigator.pop(context);
                               },
                               child: ClipRRect(
                                 borderRadius:  BorderRadius.circular(
                                     24
                                 ),
                                 child: Container(
                                     color: Colors.deepPurple,
                                     padding: EdgeInsets.all(16),
                                     child: Text('Save', style: TextStyle(color: Colors.white),)),
                               )
                           ),
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
                 Icons.edit,
                 color: Colors.deepPurple,
               ),
             ),
           ),

         ]


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
                  readOnly: true,
                  initialValue: widget.note?.title ??'',
                  decoration: new InputDecoration.collapsed(
                      hintStyle: TextStyle(
                          fontSize: 32,
                          color: Color(0XFFC8C5CB),
                          fontWeight: FontWeight.w700),
                      hintText: "Title"),
                  style: TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.w700),

                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: TextFormField(
                    readOnly: true,
                    initialValue: widget.note?.content ??'',
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: new InputDecoration.collapsed(
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0XFFC8C5CB),
                            fontWeight: FontWeight.w400),
                        hintText: "Content"),

                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 24),
                  height: 1,
                  color: Color(0xFFEFEEF0),
                ),
                Row(
                  children: [
                    if(widget.action == 'add')...[
                      Text(dateNowFormated)
                    ] else if (widget.action == 'detail')...[
                      Text(widget.note?.date ?? '')
                    ]

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
