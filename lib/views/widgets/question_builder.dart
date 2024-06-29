import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:quiz_with_firebase_provider/controllers/question_controller.dart';
import 'package:quiz_with_firebase_provider/global.dart';

// ignore: must_be_immutable
class QuestionBuilder extends StatelessWidget {
  QuestionBuilder({
    super.key,
    required this.pageController,
    required this.id,
    required this.question,
    required this.variants,
  });
  // ignore: prefer_typing_uninitialized_variables
  final pageController;
  // ignore: prefer_typing_uninitialized_variables
  final question;
  List variants;

  int id;
  int selected = 0;
  int correct = 0;
  final questionController = QuestionController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60.0.h),
      child: Column(
        children: [
          Text(
            question[id]['question'],
            style: const TextStyle(fontSize: 25),
          ),
          const Gap(40),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    if (question[id]["key"] == variants[index]) {
                      GlobalUzgaruvchilar().increse();
                    }
                    print(GlobalUzgaruvchilar().toatl());

                    pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear);
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.purple),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 30),
                      child: Center(
                        child: Text(
                          variants[index],
                          style: const TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
