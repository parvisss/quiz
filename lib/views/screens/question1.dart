import 'package:flutter/material.dart';
import 'package:quiz_with_firebase_provider/views/widgets/question_builder.dart';

// ignore: must_be_immutable
class Question1 extends StatelessWidget {
  Question1({super.key, required this.pageController, required this.question});
  // ignore: prefer_typing_uninitialized_variables
  final pageController;
  // ignore: prefer_typing_uninitialized_variables
  final question;
  final int id = 0;
  String A = "4";
  String B = "5";
  String C = "10";

  @override
  Widget build(BuildContext context) {
    return QuestionBuilder(
      pageController: pageController,
      id: id,
      question: question,
     variants: [A,B,C]
    );
  }
}
