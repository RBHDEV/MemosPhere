class Note {
String? id;
String? title;
String? content;
String? lmodifydate;

Note ({
  required this.id,
  required this.title,
  required this.content,
  required this.lmodifydate,
  });

List<Note> sampleNotes = [
  Note(id: '01',
    title: 'the day I fall',
    content: 'today is the day I fall in love with a girl that study at the same university'
    ),

  Note(
    id: '02',
    title: 'the unexpected encounter',
    content: 'it all started with an unexpected encounter on a rainy day'
    ),

  Note(
    id: '03',
    title: 'love at first sight',
    content: 'from the moment our eyes met, I knew it was love at first sight'
    ),

  Note(
    id: '04',
    title: 'the shared laughter',
    content: 'our laughter fills the air as we share jokes and create beautiful memories'
    ),

  Note(
    id: '05',
    title: 'the bond that grows',
    content: 'with each passing day, our bond grows stronger and deeper'
    ),
  
  Note(
    id: '06',
    title: 'the stolen glances',
    content: 'our eyes meet across the room, and in that moment, the world fades away'
    ),

  
  ];
  
}


