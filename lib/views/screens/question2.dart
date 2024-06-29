import 'package:flutter/material.dart';
import 'package:quiz_with_firebase_provider/views/widgets/question_builder.dart';

// ignore: must_be_immutable
class Question2 extends StatelessWidget {
  Question2({super.key, required this.pageController, required this.question});
  // ignore: prefer_typing_uninitialized_variables
  final pageController;
  // ignore: prefer_typing_uninitialized_variables
  final question;
  final int id = 1;
  String A = "10";
  String B = "4";
  String C = "-✓1223 * 123";

  @override
  Widget build(BuildContext context) {
    return QuestionBuilder(
        pageController: pageController,
        question: question,
        id: id,
        variants: [A, B, C]);
  }
}
