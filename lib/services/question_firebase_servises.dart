import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionFirebaseServices {
  final _questionsCollection = FirebaseFirestore.instance.collection("questions");

  Stream<QuerySnapshot> getQuestions() async* {
    yield* _questionsCollection.snapshots();
  }

  Future<void> addQuestion(Map<String, dynamic> questionData) async {
    await _questionsCollection.add(questionData);
  }

  Future<void> deleteQuestion(String questionId) async {
    await _questionsCollection.doc(questionId).delete();
  }

  Future<void> editQuestion(String questionId, Map<String, dynamic> updatedData) async {
    await _questionsCollection.doc(questionId).update(updatedData);
  }
}
