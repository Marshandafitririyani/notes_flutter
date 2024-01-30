import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/data/local/floor/note/note.dart';
import '../../core/utils/const.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key, required this.action, this.note});

  final String action;
  final Note? note;


  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  late String _action;
  late IconData _iconAction;

  DateTime _dateNow = DateTime.now();
  final DateFormat _dateFormatterRaw = DateFormat("yyyy-MM-dd HH:mm:ss");
  final DateFormat _dateFormat = DateFormat('d MMMM yyyy, HH:mm');


  @override
  void initState() {
    _action = widget.action;

    if(_action == Constant.ADD || _action == Constant.EDIT){
      _iconAction = Icons.save_outlined;
    }else if (_action == Constant.DETAIL) {
      _iconAction = Icons.edit_outlined;
    }

    if(_action == Constant.DETAIL || _action == Constant.EDIT){
      _dateNow = _dateFormatterRaw.parse(widget.note?.date ?? '');
    }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    print('action berasal dari ${widget.action}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              onPressed: (){
                if (_action == Constant.DETAIL) {
                  setState(() {
                    _action = Constant.EDIT;
                    _iconAction = Icons.save_outlined;
                  });
                } else {
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
                      Container(
                        margin: EdgeInsets.only(left: 35),
                        child: Row(
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
                        ),
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

                }
              },
              icon: Icon(_iconAction)
          ),
          if (_action == Constant.DETAIL)...[
            IconButton(onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Delete'),
                    content: Text('Are you sure to delete this note?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel')
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBarDelete);
                          },
                          child: Text('Delete')
                      )
                    ],
                  )
              );
            }, icon: Icon(Icons.delete_outline))
          ]



      /*    if (widget.action == 'add') ...
          [
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
                      Container(
                        margin: EdgeInsets.only(left: 35),
                        child: Row(
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
                        ),
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
          ] else if (widget.action == 'detail') ...
          [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddScreen(action: 'edit', note: widget.note);
                    }));
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            )
          ] else if (widget.action == 'edit') ...[*/
            /*Container(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.save,
                color: Colors.deepPurple,
              ),
            )
          ]*/
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
                // if (widget.action == 'detail') ...[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    height: 1,
                    color: Color(0xFFEFEEF0),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    readOnly: _action == Constant.DETAIL,
                    initialValue: widget.note?.title ?? '',
                    decoration: new InputDecoration.collapsed(
                        hintStyle: TextStyle(
                            fontSize: 32,
                            color: Color(0XFFC8C5CB),
                            fontWeight: FontWeight.w700),
                        hintText: "Title"),
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      readOnly: _action == Constant.DETAIL,
                      initialValue: widget.note?.content ?? '',
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

            Text(_dateFormat.format(_dateNow),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF827D89)))


                  /*children: [
                    if (widget.action == 'add') ...[
                      Text(dateNowFormated)
                    ] else if (widget.action == 'detail') ...[
                      Text(widget.note?.date ?? '')
                    ] else if (widget.action == 'edit')
                      Text(widget.note?.date ?? '')
                  ],*/
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

final snackBarDelete = SnackBar(
  content: const Text('Delete Succes'),
);
