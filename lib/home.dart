// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:memosphere/colors.dart';
import 'package:memosphere/editpage.dart';
import 'notelist.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Note> filteredList = [];
  bool isSorted = true;

  // Creating a list that have a function of returning notes that is sorted by the time
  // at the both bools of Sorted
  List<Note> sortNotesByTime (List<Note> notes) {
    if(isSorted) {
      notes.sort((a, b) => a.lmodifydate.compareTo(b.lmodifydate));
      }
    else {
      notes.sort((b, a) => a.lmodifydate.compareTo(b.lmodifydate));
      }
    isSorted = !isSorted;
    return notes;
    }

  @override
  void initState() {
    super.initState();
    filteredList = sampleNotes;
  }

  // Filter notes based on search input
  void onSearchTextChange (String searchInput) {
    setState(() {
      filteredList = sampleNotes.where((note) =>
      note.content!.toLowerCase().contains(searchInput.toLowerCase()) ||
      note.title!.toLowerCase().contains(searchInput.toLowerCase())
      ).toList();
      });
    }

  // Delete note at specified index
  void deleteNote (int index) {
    setState(() {
      filteredList.removeAt(index);
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: the60,

      appBar: AppBar(
        backgroundColor: the60,
        forceMaterialTransparency: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [const Text(
              'MemosPhere',
              style: TextStyle(
                color: Headline,
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontFamily: 'queensides',
                ),
              ),
            IconButton(
              onPressed: () {
                setState(() {
                  filteredList = sortNotesByTime(filteredList);
                  });
                },
              padding:  const EdgeInsets.all(0),
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: button.withOpacity(0.8),
                    ),
                  child:  const Icon(
                      Icons.sort,
                      color: buttonText,
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 30, 17, 0),
        child: Column(
          children: [
            TextField(
              onChanged: onSearchTextChange,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                hoverColor: buttonhover,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Stroke, width: 3),
                  ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Stroke, width: 2)
                  ),
                hintText: 'Search notes...',
                hintStyle: TextStyle(
                  color: Stroke.withOpacity(0.3),
                  fontSize: 16,
                  ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Stroke
                  ),
                ),
              ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 30),
                itemCount: filteredList.length,
                itemBuilder:(context, index) {
                    return  Card(
                    elevation: 3,
                    child: ListTile(
                      onTap: () async {
                        // Navigate to EditPage and await result
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => EditPage(note: filteredList[index],),
                            ),
                          );

                        if(result != null && result.length >= 2) {
                          final titleFromTheResult = result[0].text;
                          final contentFromTheRresult = result[1].text;
                          int originalIndex = sampleNotes.indexOf(filteredList[index]);
                          final Note newNote = Note(
                              id: sampleNotes[originalIndex].id,
                              title: titleFromTheResult,
                              content: contentFromTheRresult,
                              lmodifydate: DateTime.now());

                          setState(() {
                            sampleNotes[originalIndex] =  newNote;
                            filteredList = sampleNotes;
                            });
                          }
                        },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                        ),
                      tileColor: the30,
                      hoverColor: buttonhover,
                      splashColor: buttonhover.withOpacity(0.6),
                      contentPadding: EdgeInsets.all(15),
                      title: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: '${filteredList[index].title}\n',
                          style: GoogleFonts.montserrat(textStyle: TextStyle(
                            color: Headline,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            height: 1.5,
                            ),),
                          children: [
                            TextSpan(
                              text: filteredList[index].content,
                              style: GoogleFonts.montserrat(textStyle: TextStyle(
                                color: Paragraph,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 1.5,
                                ),),
                              ),
                            ]
                          ),
                        ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Last Edit: ${DateFormat('EEE MMM d, yyyy h:mm a').format(filteredList[index].lmodifydate)}',
                          style: GoogleFonts.montserrat(textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade800,
                            ),),
                          ),
                        ),
                      trailing: IconButton(
                        onPressed: () async {
                          bool? result = await _confirmation(context);
                          if(result == true) {
                            deleteNote(index);
                            }
                          },
                        icon: Icon(Icons.delete,
                          color: delete,
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showEditPage();
          },

        elevation: 10,
        backgroundColor: button,
        child: Icon(
          Icons.add,
          size: 35,
          color: buttonText,
          ),
        ),
      );
    }

  void _showEditPage () async {
    // Navigate to EditPage and await result
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => EditPage(),
              ),
            );

          if(result != null && result.length >= 2) {
            final idFromThesampleNotes = sampleNotes.length;
            final titleFromTheResult = result[0].text;
            final contentFromTheRresult = result[1].text;
            final Note newNote = Note(
                id: idFromThesampleNotes,
                title: titleFromTheResult,
                content: contentFromTheRresult,
                lmodifydate: DateTime.now());
            setState(() {
              sampleNotes.add(newNote);
              filteredList = sampleNotes;
              });
            }
  }
  
  Future<dynamic> _confirmation(BuildContext context) {
    return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: the30,
                              icon: Icon(
                                Icons.info,
                                color: Stroke.withOpacity(0.6),
                                ),

                              title: Text(
                                'Are you sure wanna delete this note?',
                                style: GoogleFonts.montserrat(textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Headline,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600
                                  ),),
                                ),

                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                      },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: theyes,
                                      ),
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                        color: buttonText,
                                        ),
                                      ),
                                    ),

                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context, false);
                                      },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: theno,
                                      ),
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                        color: buttonText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          );
  }
  }