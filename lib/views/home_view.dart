import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoneauth/widgets/main_drawer.dart';
import '../models/post.dart';
import '../widgets/searchform_home.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
    // final height = MediaQuery.of(context).size.height;
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
              slivers: [
                SliverAppBar(
                  forceMaterialTransparency: false,
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  floating: true,
                  pinned: false,
                  toolbarHeight: 300,
                  expandedHeight: 350,
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
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 20, right: 0, left: 10),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/profile');
                        },
                        child: Ink(
                          width: 60,
                          height: 60,
                          padding: const EdgeInsets.only(
                              left: 0, top: 0, right: 20, bottom: 0),
                          child: CircleAvatar(
                            radius: 23,
                            child: ClipOval(
                              child: Image.network(
                                items[0].profile_pic.toString(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(30),
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 28.0, bottom: 20),
                              child: Text(
                                'Wanna play?',
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
                                  left: 28.0, bottom: 20, right: 30),
                              child: SearchFormHome(),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              items.length,
                                  (index) => Container(
                                padding: const EdgeInsets.only(
                                    top: 0, left: 10, right: 10, bottom: 10),
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: const ShapeDecoration(
                                      shape: OvalBorder(
                                          side: BorderSide(
                                            width: 2,
                                            color: Color(0xFF596E79),
                                          ))),
                                  child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                    child: CircleAvatar(
                                      radius: 23,
                                      child: ClipOval(
                                        child: Image.network(
                                          items[index].profile_pic.toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                  'Playing partners',
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
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 24.0, left: 30, right: 30, top: 5),
                        child: Container(
                          width: 160,
                          height: 422,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: const [
                              BoxShadow(
                                  color: Color(0x1C000000),
                                  blurRadius: 5,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0)
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    EdgeInsets.only(left: 15, top: 17),
                                    child: CircleAvatar(
                                      radius: 23,
                                      child: ClipOval(
                                        child: Image.network(
                                          items[index].profile_pic.toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                items[index]
                                                    .name
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Muli',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                ),
                                              ),
                                              Text(
                                                items[index]
                                                    .published
                                                    .toString(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: Color(0xFF898A8D),
                                                  fontSize: 12,
                                                  fontFamily: 'Muli',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                  letterSpacing: -0.24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.only(left: 0),
                                    onPressed: () {
                                      // Logic for the icon button in Post
                                    },
                                    icon: Icon(CupertinoIcons.ellipsis),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 0, top: 10),
                                child: Container(
                                  width: 278,
                                  height: 148,
                                  decoration: ShapeDecoration(
                                      color: const Color(0xFFC4C4C4),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20))),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      items[index].image_url.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              SizedBox(
                                width: 266,
                                child: Text(
                                  items[index].header.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 20),
                                child: SizedBox(
                                  width: 300,
                                  height: 20,
                                  child: Text(
                                    items[index].description.toString(),
                                    style: TextStyle(
                                      color: Color(0xFF595959),
                                      fontSize: 12,
                                      fontFamily: 'Muli',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Positioned(
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 2, right: 0),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                  CupertinoIcons.heart),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16.0, right: 0),
                                            child: Text(items[index].likes.toString()),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Positioned(
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 2, right: 0),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                  CupertinoIcons.conversation_bubble),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16.0, right: 5,),
                                            child: Text(items[index].comments.toString()),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Positioned(
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(CupertinoIcons.share),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16.0, right: 0),
                                            child: Text(items[index].shared.toString()),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: items.length,
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
