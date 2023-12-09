import 'package:animated_gradient/animated_gradient.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phoneauth/views/signin.dart';
import 'package:phoneauth/views/signin_view.dart';
import 'package:phoneauth/widgets/logo_main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Hello!',
        ),
      ),
      body: AnimatedGradient(
        colors: const [
          Color(0xFF000000),
          Color(0xFF3A6433),
        ],
        child: SafeArea(
          child: Container(
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                LogoMainWidget(),
                Text(
                  'A whole lot more GOLF!',
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 14,
                      color: Color(0xffFFFFFF)),
                ),SizedBox(
                  height: 80,
                ),

                CarouselSlider(
                  items: const [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                          'Golfers want just one thing...to play more golf! Get invited to the course you’ve always wanted to play or simply find a golf partner.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 14,
                              color: Color(0xffffffff))),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                          'Golfers want just one thing...to play more golf! Get invited to the course you’ve always wanted to play or simply find a golf partner.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 14,
                              color: Color(0xffffffff))),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                          'Golfers want just one thing...to play more golf! Get invited to the course you’ve always wanted to play or simply find a golf partner.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 14,
                              color: Color(0xffffffff))),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                          'Golfers want just one thing...to play more golf! Get invited to the course you’ve always wanted to play or simply find a golf partner.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 14,
                              color: Color(0xffffffff))),
                    )
                  ],
                  //Slider Container properties
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 20 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(130), // <-- Radius
                    ),
                    minimumSize: const Size(207, 60),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  child: const Text(
                    'GET STARTED',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF596E79),
                      height: 0.07,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
