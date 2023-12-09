import 'package:flutter/material.dart';

// import '../config/app_themes.dart';

class LogoTwoWidget extends StatelessWidget {
  const LogoTwoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            key: key,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage("assets/logo_main.png"),
                width: 50,
                height: 50,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MYTEEBOX',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bungee',
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'A whole lot more GOLF!',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Muli',
                      fontSize: 12,
                      color: Color.fromRGBO(255, 255, 255, 53),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
