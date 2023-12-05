import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/post.dart';

class HomeView extends StatelessWidget {
  final List<Post> postInfo = [
    Post(
      'Daniel Mendieta',
      DateTime.now(),
      'Golf Course 1',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      '',
    ),
    Post(
      'David McKennsey',
      DateTime.now(),
      'Golf Course 2',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      '',
    ),
    Post(
      "Hugo Mendieta",
      DateTime.now(),
      'Golf Course 3',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      '',
    ),
    Post(
      "Terrence Cagliari",
      DateTime.now(),
      'Golf Course 4',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60,
        forceMaterialTransparency: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 0, left: 10),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: Ink(
                width: 60,
                height: 60,
                padding: const EdgeInsets.only(
                    left: 0, top: 0, right: 20, bottom: 0),
                child: const CircleAvatar(
                  radius: 25,
                ),
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Builder(builder: (context) {
            return IconButton(
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu_sharp),
              iconSize: 25,
            );
          }),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Wanna play?',
                            style: TextStyle(
                              fontFamily: 'Muli',
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
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
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Container(
                                    width: 350,
                                    height: 57,
                                    padding: const EdgeInsets.all(10),
                                    decoration: ShapeDecoration(
                                        color: const Color(0xFFF5F5F5),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(73))),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(73),
                                          borderSide: BorderSide.none,
                                        ),
                                        suffixIcon: Icon(Icons.search),
                                        hintText: 'eg: Mountain, Forest',
                                        hintStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF6B6B6B),
                                          fontFamily: 'Muli',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    //Stories
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(
                                          50,
                                          (index) => Container(
                                            padding: const EdgeInsets.only(
                                                top: 0,
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
                                            child: Container(
                                              width: 55,
                                              height: 55,
                                              decoration: const ShapeDecoration(
                                                  shape: OvalBorder(
                                                      side: BorderSide(
                                                width: 2,
                                                color: Color(0xFF596E79),
                                              ))),
                                              child: const CircleAvatar(
                                                radius: 22,
                                                backgroundColor: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                child: CircleAvatar(
                                                  radius: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Stack(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 410,
                        height: 525,
                        padding: const EdgeInsets.only(
                            left: 28, right: 10, top: 10, bottom: 20),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(246, 246, 246, 1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(
                                  bottom: 20, top: 15, right: 10),
                              child: Text(
                                'Playing partners',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Mulish',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0, left: 20),
                              child: IconButton(
                                icon: Icon(Icons.expand_less),
                                onPressed: () {
                                  print('Hello');
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      // SliverList(
                      //   delegate: SliverChildBuilderDelegate(
                      //     (context, index) {
                      //       final Post post = posts[index];
                      //       return PostContainer(post: post);
                      //     },
                      //     childCount: posts.bitLength,
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Center(
                      child: SizedBox(
                        width: 346,
                        height: 465,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: postInfo.length,
                          itemBuilder: (BuildContext context, int index) =>
                              buildPost(context, index),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Functions
  Widget buildPost(BuildContext context, int index) {
    final post = postInfo[index];
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Container(
        width: 400,
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
                  padding: EdgeInsets.only(left: 15, top: 17),
                  child: CircleAvatar(
                    radius: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              post.name,
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
                              "${DateFormat.Hm().format(post.published).toString()}m",
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
                  width: 65,
                ),
                IconButton(
                  padding: EdgeInsets.only(left: 0),
                  onPressed: () {
                    // Logic icon button in Post
                  },
                  icon: Icon(CupertinoIcons.ellipsis),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Container(
                width: 278,
                height: 148,
                decoration: ShapeDecoration(
                    color: const Color(0xFFC4C4C4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://www.imagensempng.com.br/wp-content/uploads/2021/08/Familia-Png.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              width: 266,
              child: Text(
                post.header,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: 300,
                height: 55,
                child: Text(
                  post.description,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Positioned(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.heart),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13.0, right: 5),
                          child: Text('221'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Positioned(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.conversation_bubble),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13.0, right: 5),
                          child: Text('221'),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Positioned(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.share),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13.0, right: 5),
                          child: Text('221'),
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
  }
}
