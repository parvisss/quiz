import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_with_firebase_provider/controllers/user_controller.dart';
import 'package:quiz_with_firebase_provider/services/auth.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: userController.list,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          final users = snapshot.data!.docs;
         

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(60),
                  CircleAvatar(
                    radius: 140,
                    backgroundImage: NetworkImage(
                      users.first['image'],
                    ),
                  ),
                  const Gap(10),
                  Text(
                    users.first['name'],
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  const Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          final auth = Auth();
                          auth.logOut();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Log out",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
