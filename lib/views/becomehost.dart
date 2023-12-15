import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoneauth/widgets/main_drawer.dart';

import '../widgets/searchform_home.dart';

class BecomeHostPage extends StatefulWidget {
  const BecomeHostPage({super.key});

  @override
  State<BecomeHostPage> createState() => _BecomeHostPageState();
}

class _BecomeHostPageState extends State<BecomeHostPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceMaterialTransparency: false,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            floating: true,
            pinned: false,
            expandedHeight: 350,
            leading: Padding(
              padding: const EdgeInsets.only(left: 15, top: 0),
              child: Builder(builder: (context) {
                return IconButton(
                  focusColor: Colors.transparent,
                  splashColor: Colors.black,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Image.asset('assets/btnLeftMenu.png'),
                  iconSize: 59,
                );
              }),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 22,
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0, bottom: 50),
                        child: Text(
                          'Become a Host',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0, bottom: 3),
                        child: Text(
                          'Search a golf course',
                          style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 14,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 28.0, bottom: 40, right: 30),
                        child: SearchFormHome(),
                      ),
                    ],
                  ),
                  Container(
                    width: width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0, top: 20),
                          child: Text(
                            'Dummy Golf Course Hosts',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0, top: 20),
                          child: Icon(Icons.keyboard_arrow_up_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
