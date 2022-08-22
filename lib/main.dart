import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:todo/injection.dart' as di;
import 'package:todo/presentation/signup/signup_page.dart';
import 'package:todo/theme.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ensure everything is initialized before building widgets
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const SignUpPage(),
    );
  }
}
