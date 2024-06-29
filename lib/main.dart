import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_with_firebase_provider/controllers/question_controller.dart';
import 'package:quiz_with_firebase_provider/controllers/user_controller.dart';
import 'package:quiz_with_firebase_provider/firebase_options.dart';
import 'package:quiz_with_firebase_provider/views/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(100, 300),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return QuestionController();
            },
          ),
          ChangeNotifierProvider(create: (context) {
            return UserController();
          })
        ],
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.purple[200]),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.purple,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
