import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phoneauth/widgets/main_drawer.dart';

import '../models/post.dart';
import '../widgets/searchform_home.dart';

class BecomeHostPage extends StatefulWidget {
  const BecomeHostPage({super.key});

  @override
  State<BecomeHostPage> createState() => _BecomeHostPageState();
}

class _BecomeHostPageState extends State<BecomeHostPage> {
  late Future<List<Post>> _future;

  // Fetch JSON contents from JSON file
  Future<List<Post>> readJson() async {
    final jsondata = await rootBundle.loadString('assets/info/info.json');
    final Map<String, dynamic> data = json.decode(jsondata);

    // Extract the list from the map
    final List<dynamic> list = data['posts'] ?? [];

    return list.map((e) => Post.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    _future = readJson();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      drawer: MainDrawer(),
      body: FutureBuilder(
        future: _future,
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (data.hasError) {
            return Center(child: Text('${data.error}'));
          } else if (data.hasData) {
            List<Post> items = data.data as List<Post>;
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  forceMaterialTransparency: false,
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  floating: true,
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
                        radius: 23,
                        child: ClipOval(
                          child: Image.network(
                            items[0].profile_pic.toString(),
                          ),
                        ),
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
                              padding:
                                  const EdgeInsets.only(left: 28.0, bottom: 50),
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
                              padding:
                                  const EdgeInsets.only(left: 28.0, bottom: 3),
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
                                padding:
                                    const EdgeInsets.only(left: 35.0, top: 20),
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
                                padding:
                                    const EdgeInsets.only(right: 35.0, top: 20),
                                child: Icon(Icons.keyboard_arrow_up_outlined),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 40.0, right: 40),
                        child: Container(
                          height: 370,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Contact with hosts all around the globe!',
                                style: TextStyle(
                                  color: Color(0xFF595959),
                                  fontSize: 12,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                  height: 0.14,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 23,
                                    child: ClipOval(
                                      child: Image.network(
                                        items[0].profile_pic.toString(),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        items[0].name.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                          letterSpacing: -0.24,
                                        ),
                                      ),
                                      const Text(
                                        '2m ago',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF898A8D),
                                          fontSize: 12,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                          letterSpacing: -0.24,
                                        ),
                                      )
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon:
                                        Icon(CupertinoIcons.ellipsis_vertical),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 23,
                                    child: ClipOval(
                                      child: Image.network(
                                        items[1].profile_pic.toString(),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          items[1].name.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                            letterSpacing: -0.24,
                                          ),
                                        ),
                                        Text(
                                          '2m ago',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF898A8D),
                                            fontSize: 12,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                            letterSpacing: -0.24,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon:
                                        Icon(CupertinoIcons.ellipsis_vertical),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 23,
                                    child: ClipOval(
                                      child: Image.network(
                                        items[2].profile_pic.toString(),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          items[2].name.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                            letterSpacing: -0.24,
                                          ),
                                        ),
                                        Text(
                                          '2m ago',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF898A8D),
                                            fontSize: 12,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                            letterSpacing: -0.24,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon:
                                        Icon(CupertinoIcons.ellipsis_vertical),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 23,
                                    child: ClipOval(
                                      child: Image.network(
                                        items[3].profile_pic.toString(),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          items[3].name.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                            letterSpacing: -0.24,
                                          ),
                                        ),
                                        Text(
                                          '2m ago',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF898A8D),
                                            fontSize: 12,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                            letterSpacing: -0.24,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon:
                                        Icon(CupertinoIcons.ellipsis_vertical),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          splashColor: Colors.transparent,
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/edithost');
                          },
                          icon: SvgPicture.asset(
                              'assets/FloatingActionButton.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
