import 'package:flutter/material.dart';
import 'package:quiz_with_firebase_provider/controllers/question_controller.dart';
import 'package:quiz_with_firebase_provider/controllers/user_controller.dart';
import 'package:quiz_with_firebase_provider/views/screens/question1.dart';
import 'package:quiz_with_firebase_provider/views/screens/question2.dart';
import 'package:quiz_with_firebase_provider/views/screens/question3.dart';
import 'package:quiz_with_firebase_provider/views/screens/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activePage = 1;

  final questionController = QuestionController();
  final userController = UserController();

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10),
          child: InkWell(
            child: const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGTWMxVys90VRND0k6SOqvL3njtCeU4C4u_R_DZOV85O8rL998xKky-L8xYR3lX31wsd4&usqp=CAU',
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(ctx)=> UserScreen(),
                ),
              );
            },
          ),
        ),
        actions: [],
      ),
      body: StreamBuilder(
        stream: questionController.list,
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          final questions = snapshot.data!.docs;
          return PageView(
            controller: pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (int page) {
              setState(
                () {
                  activePage = page;
                },
              );
            },
            children: [
              Question1(
                pageController: pageController,
                question: questions,
              ),
              Question2(
                pageController: pageController,
                question: questions,
              ),
              Question3(
                pageController: pageController,
                question: questions,
              ),
            ],
          );
        },
      ),
    );
  }
}
