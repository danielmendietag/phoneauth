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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            floating: true,
            leading: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(0, 0),
                bottomLeft: Radius.circular(0),
              ),
            ),
            actions: <Widget>[],
            expandedHeight: 300,
          ),
          SliverList(
            delegate: SliverChildListDelegate([

            ]),
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
        width: 200,
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
                  padding: const EdgeInsets.only(top: 20, left: 20),
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

