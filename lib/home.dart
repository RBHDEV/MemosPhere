import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memosphere/colors.dart';

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
            Text(
              'MemosPhere',
              style: TextStyle(
                color: the10,
                fontSize: 25,
                ),
              ),
            
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.all(0),
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: the60.withOpacity(0.8),
                    ),
                  child: Icon(
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
                border: InputBorder.none,
                fillColor: the60.withOpacity(0.8), filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  ),

            
                hintText: 'Search',
                hintStyle: TextStyle(color: the10.withOpacity(0.5)),
            
                prefixIcon: Icon(
                  Icons.search,
                  color: the10.withOpacity(0.5)
                  ),

                ),
              ),
          ),

          
          ],
        ),


      );
    }
  }