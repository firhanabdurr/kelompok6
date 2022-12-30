import 'dart:math';
import 'package:aplikasinote/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteEditor extends StatefulWidget {
  NoteEditor({Key? key}) : super(key: key);

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  //String date = DateTime.now();
  String date = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        title: const Text(
          'Add a new Note',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Note Title'),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 8.0),
            Text(
              date,
              style: AppStyle.dateTitle,
            ),
            const SizedBox(height: 28.0),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 300,
                child: TextField(
                  controller: _mainController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Note content'),
                  style: AppStyle.mainContent,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection('Notes').add({
            'note_title': _titleController.text,
            'creation_date': date,
            'note_content': _mainController.text,
            'color_id': color_id.toString()
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print('Failed to add new note due to $error'));
        },
        child: const Icon(Icons.add_box),
      ),
    );
  }
}
