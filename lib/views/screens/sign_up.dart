import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_with_firebase_provider/services/auth.dart';
import 'package:quiz_with_firebase_provider/utils/helpers.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final name = TextEditingController();
  final lastName = TextEditingController();
  final auth = Auth();
  void submit() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        await auth.register(
          emailController.text,
          passwordController.text,
        );
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } on FirebaseAuthException catch (error) {
        // ignore: use_build_context_synchronously
        Helpers.showErrorDialog(
          context,
          error.message ?? "Error",
        );
      } catch (e) {
        Helpers.showErrorDialog(
          context,
          "tizimda xatolik",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 120,
                ),
                const Gap(50),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  controller: emailController,
                ),
                const Gap(10),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  controller: passwordController,
                ),
                const Gap(10),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  controller: name,
                ),
                const Gap(10),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Last Name",
                    border: OutlineInputBorder(),
                  ),
                  controller: lastName,
                ),
                const Gap(50),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: submit,
                    child: const Text("Sign Un"),
                  ),
                ),
                const Gap(10),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color.fromARGB(255, 117, 102, 102),
                        fontSize: 14,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
