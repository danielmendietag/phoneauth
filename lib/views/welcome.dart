import 'package:animated_gradient/animated_gradient.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Hello!',
        ),
      ),
      body: AnimatedGradient(
        colors: const [
          Color(0xFF000000),
          Color(0xFF3A6433),
        ],
        child: SafeArea(
          child: Container(),
        ),
      ),
    );
  }
}
