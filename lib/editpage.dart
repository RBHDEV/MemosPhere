import 'package:flutter/material.dart';
import 'package:memosphere/colors.dart';

class editpage extends StatefulWidget {
  const editpage({super.key});

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
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
                  },
                
                padding:  EdgeInsets.all(0),
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: theblue.withOpacity(0.8),
                      ),
                    child:  Icon(
                        Icons.arrow_back,
                        color: the60,
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      color: 
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],       
        ),
    ),

      
    );
  }
}
