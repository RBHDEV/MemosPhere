// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:memosphere/colors.dart';
import 'package:memosphere/notelist.dart';

class EditPage extends StatefulWidget {
  final Note? note;
  const EditPage({super.key, this.note});

  @override
  State<EditPage> createState() => _EditPageState();
}
class _EditPageState extends State<EditPage> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      _titleController = TextEditingController(text: widget.note!.title);
      _contentController = TextEditingController(text: widget.note!.content);
      }

    super.initState();
  }

  @override
  void dispose() {
    // Disposing controllers
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: the60,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 30, 17, 0),
        child: Column(
          children: [Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  },
                padding:  EdgeInsets.all(0),
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: button.withOpacity(0.8),
                      ),
                    child:  Icon(
                        Icons.arrow_back,
                        color: buttonText,
                        ),
                    ),
                  ),
                ),
              ],
            ),

          Expanded(
            child: ListView(
              children: [
                TextField(
                  controller: _titleController,
                  style: TextStyle(
                    color: Headline,
                    fontSize: 30,
                    ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: Headline.withOpacity(0.5),
                      fontSize: 30,
                      ),
                    ),
                  ),

                TextField(
                  controller: _contentController,
                  style: TextStyle(
                    color: Headline,
                    ),
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type the Note...',
                    hintStyle: TextStyle(
                      color: Headline.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    floatingActionButton: SizedBox(
      height: 60,
      width: 80,
      child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context,[
              _titleController,
              _contentController,
              ]);
            },

          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(25)
            ),
          backgroundColor: button,

          child: Icon(
            Icons.save,
            size: 35,
            color: buttonText,
            ),
          ),
      ),
    );
  }

}
