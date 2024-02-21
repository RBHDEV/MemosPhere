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
  bool Sorted = false;

  // Creating a list that have a function of returning notes that is sorted by the time
  // at the both bools of Sorted
  List<Note> sortNotesByTime (List<Note> notes) {
    if(Sorted) {
      notes.sort((a, b) => a.lmodifydate.compareTo(b.lmodifydate));
      }
    else {
      notes.sort((b, a) => a.lmodifydate.compareTo(b.lmodifydate));
      }

    print('You Clicked the Sort Button');
    Sorted = !Sorted;
    return notes;
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredList = sampleNotes;
  }

  void onSearchTextChange (String searchInput) {
    setState(() {
      filteredList = sampleNotes.where((note) => 
      note.content!.toLowerCase().contains(searchInput.toLowerCase()) ||
      note.title!.toLowerCase().contains(searchInput.toLowerCase())
      ).toList();
    });
    }

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
          children: [
             Text(
              'MemosPhere',
              style: TextStyle(
                color: theblue,
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
                      Icons.sort,
                      color: the60,
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
                fillColor: the30.withOpacity(0.8), filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: the60),
                  ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent)
                  ),
            
            
                hintText: 'Search notes...',
                hintStyle: TextStyle(
                  color: theblack.withOpacity(0.3),
                  fontSize: 16,
                  ),
            
                prefixIcon: Icon(
                  Icons.search,
                  color: the10
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                        ),
                    child: ListTile(
                      onTap: () {},
                      tileColor: the30,
                      contentPadding: EdgeInsets.all(15),
                      title: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: '${filteredList[index].title}\n',
                          style: GoogleFonts.montserrat(textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            height: 1.5,
                            ),),
                          children: [
                            TextSpan(
                              text: filteredList[index].content,
                              style: GoogleFonts.montserrat(textStyle: TextStyle(
                                color: Colors.black,
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
                          final result = await _Confirmation(context);
                          
                          if(result) {
                            deleteNote(index);
                            }
                          },
                        icon: Icon(Icons.delete,
                          color: the10,
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => editpage()
              )
            );
          },
        backgroundColor: the10,
        child: Icon(
          Icons.add,
          size: 35,
          color: the60,
          ),
        ),
      );
    }

  Future<dynamic> _Confirmation(BuildContext context) {
    return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: the30,
                              icon: Icon(
                                Icons.info,
                                color: Colors.grey[800],
                                ),

                              title: Text(
                                'Are you sure wanna delete this note?',
                                style: GoogleFonts.montserrat(textStyle: TextStyle(
                                  fontSize: 18,
                                  color: theblack,
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
                                        color: the60,
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
                                        color: the60,
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