import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phoneauth/views/aboutus.dart';
import 'package:phoneauth/views/becomehost.dart';
import 'package:phoneauth/views/home_view.dart';
import 'package:phoneauth/views/whatsnew.dart';
import 'package:phoneauth/widgets/logo_two.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF000000),
              Color(0xFF3A6433),
            ],
          ),
        ),
        child: ListView(
          padding:
              const EdgeInsets.only(left: 10, bottom: 0, top: 40, right: 0),
          children: <Widget>[
            LogoTwoWidget(),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: const Text(
                'MYTEEBOX',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Bungee',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              tileColor:
                  Get.currentRoute == '/aboutus' ? Colors.grey[300] : null,
              onTap: () {
                Get.to(() => AboutUsPage());
              },
            ),
            ListTile(
              title: const Text(
                'Find a Host',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Muli',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              tileColor: Get.currentRoute == '/home' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => HomeView());
              },
            ),
            ListTile(
              title: const Text(
                'Become a Host',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Muli',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              tileColor:
                  Get.currentRoute == '/becomehost' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => BecomeHostPage());
              },
            ),
            ListTile(
              title: const Text(
                'What´s new',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Muli',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              tileColor:
                  Get.currentRoute == '/whatsnew' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => WhatsNewPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}


