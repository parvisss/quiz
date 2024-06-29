import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_with_firebase_provider/controllers/user_controller.dart';
import 'package:quiz_with_firebase_provider/global.dart';

class UserScreen extends StatelessWidget {
  final userController = UserController();

  UserScreen({super.key});
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
          final user = snapshot.data!.docs;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'correct answers ${GlobalUzgaruvchilar().toatl()}',
                  style: const TextStyle(fontSize: 30),
                ),
                const Gap(60),
                CircleAvatar(
                  radius: 140,
                  backgroundImage: NetworkImage(
                    user.first['image'],
                  ),
                ),
                const Gap(10),
                Text(
                  user.first['name'],
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
