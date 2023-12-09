import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phoneauth/controllers/home_controller.dart';
import 'package:phoneauth/services/auth_services.dart';
import 'package:phoneauth/services/provider.dart';
import 'package:phoneauth/views/home_view.dart';
import 'package:phoneauth/views/signin.dart';
import 'package:phoneauth/views/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Provider(
      AuthServices(),
      FirebaseFirestore.instance,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomeView(),
        routes: <String, WidgetBuilder> {
          '/home': (BuildContext context) => HomeController(),
          '/welcome': (BuildContext context) => WelcomePage(),
          '/signUp': (BuildContext context) => SignInPage(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) => SignInPage(authFormType: AuthFormType.signIn),
          '/phone': (BuildContext context) => SignInPage(authFormType: AuthFormType.phone),
          '/reset': (BuildContext context) => SignInPage(authFormType: AuthFormType.reset),
          '/otp': (BuildContext context) => SignInPage(authFormType: AuthFormType.otp),
        },
      ),
    );
  }
}

