import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionFirebaseServises {
  final _questionsCollection =
      FirebaseFirestore.instance.collection("questions");

  Stream<QuerySnapshot> getQuestions() async* {
    yield* _questionsCollection.snapshots();
  }
}
