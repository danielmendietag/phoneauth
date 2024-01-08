import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoneauth/models/user.dart' as MyAppUser;
import 'package:phoneauth/widgets/main_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<List<MyAppUser.MyUser>> _future;

  // Fetch JSON contents from JSON file
  Future<List<MyAppUser.MyUser>> readJson() async {
    final jsondata = await rootBundle.loadString('assets/info/info.json');
    final Map<String, dynamic> data = json.decode(jsondata);

    // Extract the list from the map
    final List<dynamic> list = data['users'] ?? [];

    return list.map((e) => MyAppUser.MyUser.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    _future = readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: FutureBuilder(
        future: _future,
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.hasError) {
            return Center(
              child: Text(
                '${data.error}',
              ),
            );
          } else if (data.hasData) {
            List<MyAppUser.MyUser> items = data.data as List<MyAppUser.MyUser>;

            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: Text(
                    'danielmendietag',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Builder(builder: (context) {
                      return IconButton(
                        focusColor: Colors.transparent,
                        splashColor: Colors.black,
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: Image.asset('assets/btnLeftMenu.png'),
                        iconSize: 59,
                      );
                    }),
                  ),
                  actions: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/editprofile');
                      },
                      icon: Icon(CupertinoIcons.ellipsis_vertical),
                    ),
                  ],
                  expandedHeight: 300,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(300),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Stack(
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 50,
                                              child: ClipOval(
                                                child: Image.network(
                                                    items[0].profilePic.toString()),
                                              ),
                                            ),
                                            Positioned(
                                              top: 65,
                                              left: 55,
                                              child: IconButton(
                                                color: Colors.green,
                                                icon: SvgPicture.asset(
                                                  'assets/add_circle.svg',
                                                  width: 45,
                                                  height: 45,
                                                ),
                                                onPressed: () {
                                                  //
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0, left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Daniel Mendieta',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w700,
                                          height: 0.06,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      // Verify breakline when text overflow
                                      Text(
                                        'Home course: ${items[0].golfCourse.toString()}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w400,
                                          height: 0.15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        '${items[0].city.toString()}, ${items[0].country.toString()}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w400,
                                          height: 0.15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Hcp: ${items[0].handicap.toString()}',
                                        style: TextStyle(
                                          color: Color(0xFF31762B),
                                          fontSize: 14,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w800,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 350,
                                  height: 80,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF8F8F8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 18.0),
                                            child: Text(
                                              'Rounds Hosted ',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Color(0xFF595959),
                                                fontSize: 14,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w400,
                                                height: 0.07,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 18.0),
                                            child: Text(
                                              '12',
                                              style: TextStyle(
                                                color: Color(0xFF596E79),
                                                fontSize: 20,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w800,
                                                height: 0.06,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 18.0),
                                            child: Text(
                                              'Rounds Played ',
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF595959),
                                                fontSize: 14,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w400,
                                                height: 0.07,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 18.0),
                                            child: Text(
                                              '52',
                                              style: TextStyle(
                                                color: Color(0xFF596E79),
                                                fontSize: 20,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w800,
                                                height: 0.06,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 18.0),
                                            child: Text(
                                              'Golf Buddies ',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF595959),
                                                fontSize: 14,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w400,
                                                height: 0.07,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 18.0),
                                            child: Text(
                                              '10',
                                              style: TextStyle(
                                                color: Color(0xFF596E79),
                                                fontSize: 20,
                                                fontFamily: 'Mulish',
                                                fontWeight: FontWeight.w800,
                                                height: 0.06,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 150.0),
                                  child: Text('Gallery'),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.keyboard_arrow_up),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          // Return an empty widget if there's no data
          return SizedBox.shrink();
        },
      ),
    );
  }
}
