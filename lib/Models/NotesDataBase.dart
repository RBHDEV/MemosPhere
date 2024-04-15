import 'package:memosphere/Models/Notes.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesDataBase extends ChangeNotifier {
  static late Isar isar;

  // INITIALIZE THE DATABASE
  static Future<void> initialize() async {
    final dir =
        await getApplicationDocumentsDirectory(); // Changed to Application Documents Directory
    isar = await Isar.open([NotesSchema], directory: dir.path);

    // Load initial data on first launch
    final isFirstLaunch = await _isFirstLaunch();
    if (isFirstLaunch) {
      await _insertSampleData();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('medicalAppLaunched', true); // Marking first launch
    }
  }

  // Function to check for first launch (optional)
  static Future<bool> _isFirstLaunch() async {
    // Implement your preferred logic to determine first launch
    // (e.g., SharedPreferences, local file existence)
    final prefs = await SharedPreferences.getInstance();
    return !prefs.containsKey('medicalAppLaunched');
  }

  static Future<void> _insertSampleData() async {
    final List<Notes> notesList = [
      Notes()
        ..id = 1
        ..title = 'Welcome Message'
        ..content =
            'Welcome to MemosPhere! Your new favorite space for thoughts, lists, and everything in-between.'
        ..createddate = DateTime.now(),
      Notes()
        ..id = 2
        ..title = 'Getting Started'
        ..content =
            'Quick Start: Tap the ' + ' button to create your first note!'
        ..createddate = DateTime.now(),
      Notes()
        ..id = 3
        ..title = 'Features Overview'
        ..content =
            'You can search for the notes in the search bar at the top, also you can sort your notes by time by tapping in the sort button at the top right'
        ..createddate = DateTime.now(),
      Notes()
        ..id = 4
        ..title = 'Tips and Tricks'
        ..content =
            'Swipe left on a note to archive or delete it.\nLong press on a note to select multiple notes for batch actions.'
        ..createddate = DateTime.now(),
      Notes()
        ..id = 5
        ..title = 'Support'
        ..content =
            'Need help? Visit the Help section or contact us directly through the app.'
        ..createddate = DateTime.now(),
      Notes()
        ..id = 6
        ..title = 'See What Else We' 've Built for You'
        ..content =
            'Explore all the tools and features at other apps builded by US!. '
        ..createddate = DateTime.now(),
    ];
  }
}
