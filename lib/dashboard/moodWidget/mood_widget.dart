import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/dashboard/moodWidget/mood_widget_view.dart';


class MoodWidget extends StatelessWidget {
  const MoodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              _showDialog(context);
            },
            child: Card(
                margin: EdgeInsets.all(12),
                shadowColor: Colors.grey,
                elevation: 7,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: MoodWidgetView())));
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('How are you feeling?'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'Joyful');
                  _AddMood(DateTime.now(), 90);
                },
                child: const Text('Joyful'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'Happy');
                  _AddMood(DateTime.now(), 70);
                },
                child: const Text('Happy'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'Content');
                  _AddMood(DateTime.now(), 50);
                },
                child: const Text('Content'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'Sad');
                  _AddMood(DateTime.now(), 30);
                },
                child: const Text('Sad'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'Depressed');
                  _AddMood(DateTime.now(), 10);
                },
                child: const Text('Depressed'),
              )
            ],
          );
        });
  }

  Future<void> _AddMood(DateTime date, int value) async {
    FirebaseFirestore.instance
        .collection('Moods')
        .add({
          'user': FirebaseAuth.instance.currentUser!.uid,
          'date': DateTime.now(), //timestamp
          'value': value
        })
        .then((value) => print("Mood Added"))
        .catchError((error) => print("Failed to add mood: $error"));
  }
}
