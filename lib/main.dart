import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/view/auth/login/login_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration(seconds: 0),
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}

