import 'package:api_integration/model/note.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('API demo'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/allNotes');
              },
              child: const Text('All Notes'),
            ),
            ElevatedButton(
              onPressed: () {
                addNote();
              },
              child: const Text('Add Note'),
            ),
            ElevatedButton(
              onPressed: () {
                updateNote();
              },
              child: const Text('Update Note'),
            ),
            ElevatedButton(
              onPressed: () {
                deleteNote();
              },
              child: const Text('Delete Note'),
            ),
          ],
        ));
  }
}
