import 'package:api_integration/model/note.dart';
import 'package:flutter/material.dart';

class AllNotes extends StatefulWidget {
  const AllNotes({Key? key}) : super(key: key);

  @override
  _AllNotesState createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
  List<Note> allNotes = [];

  Future<void> getListOfAllNotes() async {
    List<Note> listAllNotes = await getAllNotes();
    setState(() {
      allNotes = listAllNotes;
    });
    print("........");
    print(allNotes);
  }

  @override
  void initState() {
    super.initState();
    getListOfAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Notes'),
      ),
      body: ListView.builder(
          itemCount: allNotes.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Center(child: Text(allNotes[index].id.toString())),
                    subtitle: Center(
                        child: Text(allNotes[index].completed.toString())),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      allNotes[index].title,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
