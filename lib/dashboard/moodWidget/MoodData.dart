import 'package:cloud_firestore/cloud_firestore.dart';

class MoodData {
  MoodData(this._timestamp, this.value);

  final Timestamp _timestamp;
  final int value;

  Timestamp get getTimestamp {
    return _timestamp;
  }
}
