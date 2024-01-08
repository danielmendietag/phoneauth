import 'package:flutter/material.dart';
import 'package:phoneauth/widgets/main_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditing extends StatefulWidget {
  const ProfileEditing({super.key});

  @override
  State<ProfileEditing> createState() => _ProfileEditingState();
}

class _ProfileEditingState extends State<ProfileEditing> {
  late SharedPreferences localStorage;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController golfCourseController = TextEditingController();
  TextEditingController typeHostController = TextEditingController();
  TextEditingController handicapController = TextEditingController();

  Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  save() async {
    localStorage.setString('name', nameController.text.toString());
    localStorage.setString('last_name', lastNameController.text.toString());
    localStorage.setString('nickname', nickNameController.text.toString());
    localStorage.setString('golf_course', golfCourseController.text.toString());
    localStorage.setString('type_host', typeHostController.text.toString());
    localStorage.setString('handicap', handicapController.text.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Profile',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 38.0, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10, top: 0, bottom: 5),
                  width: 318,
                  height: 62,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(63),
                    ),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(73),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B6B6B),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10, top: 0, bottom: 5),
                  width: 318,
                  height: 62,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(63),
                    ),
                  ),
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(73),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Last name',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B6B6B),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10, top: 0, bottom: 5),
                  width: 318,
                  height: 62,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(63),
                    ),
                  ),
                  child: TextField(
                    controller: nickNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(73),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Nickname',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B6B6B),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10, top: 0, bottom: 5),
                  width: 318,
                  height: 62,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(63),
                    ),
                  ),
                  child: TextField(
                    controller: golfCourseController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(73),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                      ),
                      hintText: 'Golf Course',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B6B6B),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10, top: 0, bottom: 5),
                  width: 318,
                  height: 62,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(63),
                    ),
                  ),
                  child: TextField(
                    controller: typeHostController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(73),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Type of Host',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B6B6B),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10, top: 0, bottom: 5),
                  width: 318,
                  height: 62,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(63),
                    ),
                  ),
                  child: TextField(
                    controller: handicapController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(73),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Handicap',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B6B6B),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
