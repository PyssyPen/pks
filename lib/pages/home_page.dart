import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/item_note.dart';
import 'package:flutter_application_1/pages/note_page.dart';

final List<String> notes = <String>['ИМЯ 1', 'ИМЯ 2', 'ИМЯ 3', 'ИМЯ 4'];
final List<String> array = <String>['заметка 1', 'заметка 2', 'заметка 3', 'заметка 4'];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('ЗАМЕТКИ', style: TextStyle(fontSize: 24, color: Colors.white),),), backgroundColor: Colors.black,
      ),
      body: Padding(padding: const EdgeInsets.all(8),
        child: ListView.builder(
        padding: const EdgeInsets.all(8),
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => NotePage(titleNote: notes[index], textNote: array[index],)),
              ),
              child: ItemNote(titleNote: notes[index], textNote: array[index],),);
          },
        ),
      ), backgroundColor: const Color.fromARGB(255, 25, 27, 185),
    );
  }
}
