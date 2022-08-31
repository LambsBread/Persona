import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// This class provides the application with the firebase authentication service
class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> get getName async {
    return await _auth.currentUser!.displayName.toString();
  }

  Future<void> createUserEmailandPassword(String email, String password,
      String nickName, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _auth.currentUser!.updateDisplayName(nickName);
    } on FirebaseAuthException catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(error.message!),
            actions: <Widget>[
              TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
        },
      );
    }
  }

  Future<void> signInEmailandPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(error.message!),
            actions: <Widget>[
              TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
        },
      );
    }
  }
}
