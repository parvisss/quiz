import 'package:flutter/material.dart';
import 'package:quiz_with_firebase_provider/services/question_firebase_servises.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionController extends ChangeNotifier {
  final _questionFirebaseServises = QuestionFirebaseServices();

  Stream<QuerySnapshot> get list {
    return _questionFirebaseServises.getQuestions();
  }

  Future<void> addQuestion(Map<String, dynamic> questionData) async {
    await _questionFirebaseServises.addQuestion(questionData);
    notifyListeners();
  }

  Future<void> editQuestion(
      String questionId, Map<String, dynamic> updatedData) async {
    await _questionFirebaseServises.editQuestion(questionId, updatedData);
    notifyListeners();
  }

  Future<int> getLength() async {
    return await list.length;
  }

  Future<void> deleteQuestion(String questionId) async {
    await _questionFirebaseServises.deleteQuestion(questionId);
    notifyListeners();
  }
}
