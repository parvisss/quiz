import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_with_firebase_provider/services/auth.dart';
import 'package:quiz_with_firebase_provider/utils/helpers.dart';
import 'package:quiz_with_firebase_provider/views/screens/sign_up.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final auth = Auth();

  void submit() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        await auth.login(
          emailController.text,
          passwordController.text,
        );
      } on FirebaseAuthException catch (error) {
        // ignore: use_build_context_synchronously
        Helpers.showErrorDialog(context, error.message ?? "Error");
      } catch (e) {
        // ignore: use_build_context_synchronously
        Helpers.showErrorDialog(context, "Tizimda hatolik");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(50),
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
                const Gap(50),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: () {
                      submit();
                    },
                    child: const Text("signin"),
                  ),
                ),
                const Gap(30),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const SignUp(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color.fromARGB(255, 117, 102, 102),
                        fontSize: 18,
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
