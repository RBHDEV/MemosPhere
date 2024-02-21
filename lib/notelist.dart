class Note {
final id;
String? title;
String? content;
final lmodifydate;

Note ({
  required this.id,
  required this.title,
  required this.content,
  required this.lmodifydate,
  });
  
}

List<Note> sampleNotes = [
  Note(id: '01',
    title: 'the day I fall',
    content: 'today is the day I fall in love with a girl that study at the same university, but the problem is that I love her so much that I would''ve kill myself',
    lmodifydate: DateTime(2024, 12, 20, 17, 30),
    ),

  Note(
    id: '02',
    title: 'the unexpected encounter',
    content: 'it all started with an unexpected encounter on a rainy day',
    lmodifydate: DateTime(2024, 9, 7, 5, 30),
    ),

  Note(
    id: '03',
    title: 'love at first sight',
    content: 'from the moment our eyes met, I knew it was love at first sight',
    lmodifydate: DateTime(2024, 5, 15, 9, 22),
    ),

  Note(
    id: '04',
    title: 'the shared laughter',
    content: 'our laughter fills the air as we share jokes and create beautiful memories',
    lmodifydate: DateTime(2024, 3, 3, 1, 30),
    ),

  Note(
    id: '05',
    title: 'the bond that grows',
    content: 'with each passing day, our bond grows stronger and deeper',
    lmodifydate: DateTime(2024, 2, 18, 22, 01),
    ),
  
  Note(
    id: '06',
    title: 'the stolen glances',
    content: 'our eyes meet across the room, and in that moment, the world fades away',
    lmodifydate: DateTime(2024, 1, 21, 8, 01),
    ),

  
  ];


