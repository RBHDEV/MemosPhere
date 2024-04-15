import 'package:flutter/material.dart';
import 'package:memosphere/Elements/colors.dart';

class editpage extends StatefulWidget {
  const editpage({super.key});

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: the60,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 30, 17, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.all(0),
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: button.withOpacity(0.8),
                      ),
                      child: Icon(
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
            Navigator.pop(context, [_titleController, _contentController]);
          },
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
