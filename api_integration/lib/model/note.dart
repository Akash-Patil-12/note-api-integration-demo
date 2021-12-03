import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Note {
  int userId;
  int id;
  String title;
  bool completed;
  Note(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        completed: json['completed'] as bool);
  }
}

Future<List<Note>> getAllNotes() async {
  List<Note> allNotes = [];
  const headers = {'Content-Type': 'application/json; charset=UTF-8'};
  var client = http.Client();
  var responce = await client.get(
    Uri.parse("https://jsonplaceholder.typicode.com/todos"),
    headers: headers,
    // body: loginUserObject
  );
  if (responce.statusCode == 200) {
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>??????????<");
    print(responce.body);
    var noteResponce = jsonDecode(responce.body);
    for (var note in noteResponce) {
      allNotes.add(Note.fromJson(note));
    }
    print(allNotes);
    return allNotes;
  } else {
    print(',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,');
    return allNotes;
  }
}

Future<void> addNote() async {
  var note = json
      .encode({"userId": 2002, "title": "note update demo", "completed": true});

  const headers = {'Content-Type': 'application/json; charset=UTF-8'};
  var client = http.Client();
  try {
    var responce = await client.post(
        Uri.parse("https://jsonplaceholder.typicode.com/todos"),
        headers: headers,
        body: note);

    if (responce.statusCode == 200) {
      print('........post............');
      print(responce.body);
    } else {
      print(responce.statusCode);
      print('.....post error.....');
    }
  } catch (e) {
    print("...................................");
    print(e);
  }
}

Future<void> updateNote() async {
  int updateToId = 1;
  var note = json.encode(
      {'userId': 12, 'id': 1, 'title': "note update demo", 'completed': true});

  const headers = {'Content-Type': 'application/json; charset=UTF-8'};
  var client = http.Client();
  var responce = await client.put(
      Uri.parse("https://jsonplaceholder.typicode.com/todos/$updateToId"),
      headers: headers,
      body: note);
  if (responce.statusCode == 200) {
    print('........put............');
    print(responce.body);
  } else {
    print('.....put error......');
  }
}

Future<void> deleteNote() async {
  int deleteId = 1;
  const headers = {'Content-Type': 'application/json; charset=UTF-8'};
  var client = http.Client();
  var responce = await client.delete(
    Uri.parse("https://jsonplaceholder.typicode.com/todos/$deleteId"),
    headers: headers,
  );
  if (responce.statusCode == 200) {
    print('........delete............');
    print(responce.body);
  } else {
    print('.....delete error......');
  }
}
