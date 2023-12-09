import 'package:flutter/material.dart';

class LogoMainWidget extends StatelessWidget {
  const LogoMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 260,
      height: 300,
      child: Column(
        children: [
          Image(
            image: AssetImage("assets/logo_main.png"),
            width: 175,
            height: 175,
          ),
          SizedBox(
            height: 10,
          ),
          Image(
            image: AssetImage("assets/main_title.png"),
          ),
        ],
      ),
    );
  }
}
