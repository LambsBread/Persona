import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/data/services/my_firebase_auth.dart';
import 'package:persona_application/data/sign_in_up/sign_in.dart';
import 'package:persona_application/widgets/home_page.dart';
import 'package:provider/src/provider.dart';

class LandingPage extends StatelessWidget {
  //final Stream<User?> _authStateChanges =
  //FirebaseAuth.instance.idTokenChanges();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: context.watch<AuthenticationService>().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return SignIn();
          }
          return MyHomePage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
      },
    );
  }
}
