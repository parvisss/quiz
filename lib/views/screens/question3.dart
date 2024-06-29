import 'package:flutter/material.dart';
import 'package:quiz_with_firebase_provider/views/widgets/question_builder.dart';

// ignore: must_be_immutable
class Question3 extends StatelessWidget {
   Question3({super.key, required this.pageController, required this.question});
  // ignore: prefer_typing_uninitialized_variables
  final pageController;
  // ignore: prefer_typing_uninitialized_variables
  final question;
  final int id = 2;
  String A = "Blue";
  String B = "5";
  String C = "Black";
  @override
  Widget build(BuildContext context) {
    return QuestionBuilder(
      pageController: pageController,
      question: question,
      id: id,variants: [A,B,C],
      
    );
  }
}
