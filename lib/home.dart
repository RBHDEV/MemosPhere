import 'package:flutter/material.dart';
import 'package:memosphere/colors.dart';
import 'notelist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thebg,

      appBar: AppBar(
        backgroundColor: thebg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'MemosPhere',
              style: TextStyle(
                color: the10,
                fontSize: 25,
                ),
              ),
            
            IconButton(
              onPressed: () {},
              padding: const EdgeInsets.all(0),
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: the60.withOpacity(0.7),
                    ),
                  child: const Icon(
                      Icons.sort,
                      color: the10,
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              decoration: InputDecoration(
                fillColor: the60.withOpacity(0.6), filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: the60),
                  ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent)
                  ),

            
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: the10.withOpacity(0.8),
                  fontSize: 18,
                  ),
            
                prefixIcon: Icon(
                  Icons.search,
                  color: the10.withOpacity(0.8)
                  ),

                ),
              ),
            ),
          
          Expanded(
            child: ListView.builder(
              itemCount: sampleNotes.length,
              itemBuilder:(context, index) {
                  return  Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                    ),
                  child: ListTile(
                    title: RichText(
                      maxLines: 3,
                      text: TextSpan(
                        text: '${sampleNotes[index].title}\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1.5,
                          ),
                        children: [
                          TextSpan(
                            text: sampleNotes[index].content,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              height: 1.5,
                              ),
                            ),
                          ]
                        ),
                      ),
                    
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Last Edit : 01/02/2024',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                    
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete,
                        color: the30,
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 35,
          color: the30,

          ),
        ),
      );
    }
  }