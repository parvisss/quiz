import 'package:flutter/material.dart';
import 'package:quiz_with_firebase_provider/services/question_firebase_servises.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionController extends ChangeNotifier {
  final _questionFirebaseServises = QuestionFirebaseServises();

  Stream<QuerySnapshot> get list {
    return _questionFirebaseServises.getQuestions();
  }
}
