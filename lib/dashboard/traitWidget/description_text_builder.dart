import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:persona_application/dashboard/traitWidget/trait_description_text.dart';

class DescriptionBuilder extends StatelessWidget {
  const DescriptionBuilder({Key? key, required final this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Tests')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text('');
          } else {
            try {
              //List<double> myersScores =
              //snapshot.data!.get("myersScores").cast<double>();
              //this.myersValues = myersScores;

              List<double> bigScores =
                  snapshot.data!.get("bigScores").cast<double>();
              return TraitDescriptionText(scores: bigScores);
            } catch (e) {
              print(
                  "A score was not found in database or the format was incorrect");
            }
            return TraitDescriptionText(scores: []);
          }
        });
  }
}
