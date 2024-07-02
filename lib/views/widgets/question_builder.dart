import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:quiz_with_firebase_provider/controllers/question_controller.dart';
import 'package:provider/provider.dart';

class QuestionBuilder extends StatefulWidget {
  QuestionBuilder({
    super.key,
    required this.pageController,
    required this.id,
    required this.question,
    required this.variants,
  });

  final PageController pageController;
  final List<dynamic> question;
  final List<String> variants;

  final int id;

  @override
  State<QuestionBuilder> createState() => _QuestionBuilderState();
}

class _QuestionBuilderState extends State<QuestionBuilder> {
  final int selected = 0;
  final int correct = 0;
  final questionController = QuestionController();

  void _addQuestion(BuildContext context) {
    final TextEditingController questionController = TextEditingController();
    final List<TextEditingController> optionsControllers =
        List.generate(3, (index) => TextEditingController());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Question'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: questionController,
                  decoration: const InputDecoration(labelText: 'Question'),
                ),
                ...optionsControllers.map((controller) {
                  return TextField(
                    controller: controller,
                    decoration: const InputDecoration(labelText: 'Option'),
                  );
                }).toList(),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final newQuestionData = {
                  'question': questionController.text,
                  'options': optionsControllers
                      .map((controller) => controller.text)
                      .toList(),
                  'correctOption':
                      0, // set the correct option index accordingly
                };

                try {
                  await context
                      .read<QuestionController>()
                      .addQuestion(newQuestionData);
                  Navigator.of(context).pop();
                } catch (e) {
                  // Handle any errors
                  print(e);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _editQuestion(BuildContext context) {
    final TextEditingController questionController =
        TextEditingController(text: widget.question[widget.id]['question']);
    final List<TextEditingController> optionsControllers = widget.variants
        .map((variant) => TextEditingController(text: variant))
        .toList();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Question'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: questionController,
                  decoration: const InputDecoration(labelText: 'Question'),
                ),
                ...optionsControllers.map((controller) {
                  return TextField(
                    controller: controller,
                    decoration: const InputDecoration(labelText: 'Option'),
                  );
                }).toList(),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final updatedData = {
                  'question': questionController.text,
                  'options': optionsControllers
                      .map((controller) => controller.text)
                      .toList(),
                  'correctOption': correct,
                };

                await this
                    .questionController
                    .editQuestion(widget.question[widget.id].id, updatedData);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteQuestion(BuildContext context) async {
    final bool? confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Question'),
          content: const Text('Are you sure you want to delete this question?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      await context
          .read<QuestionController>()
          .deleteQuestion(widget.question[widget.id].id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60.0.h),
      child: Column(
        children: [
          Text(
            widget.question[widget.id]['question'],
            style: const TextStyle(fontSize: 25),
          ),
          const Gap(40),
          Row(
            children: [
              TextButton(
                onPressed: () => _editQuestion(context),
                child: const Text("Edit"),
              ),
              TextButton(
                onPressed: () => _deleteQuestion(context),
                child: const Text("Delete"),
              ),
              TextButton(
                onPressed: () => _addQuestion(context),
                child: const Text("Add"),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.variants.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    widget.pageController.nextPage(
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
                          widget.variants[index],
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
