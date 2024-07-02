import 'package:flutter/material.dart';
import 'package:quiz_with_firebase_provider/controllers/user_controller.dart';

class TopScreen extends StatelessWidget {
  TopScreen({
    super.key,
  });
  final userController = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          userController.sortTop(users);
          final user = userController.sortTop(users);

          return ListView.builder(
            itemCount: userController.sortTopLenght(),
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(
                  user[index]["name"],
                  style: const TextStyle(fontSize: 24),
                ),
                subtitle: Text(
                  user[index]["currectAnswers"].toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                trailing: user[index]["currectAnswers"] ==
                        userController.sortTop(users)[0]["currectAnswers"]
                    ? const Text(
                        "🥇",
                        style: TextStyle(fontSize: 30),
                      )
                    : const Text(""),
              );
            },
          );
        },
      ),
    );
  }
}
