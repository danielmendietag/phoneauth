import 'package:flutter/material.dart';
import 'package:phoneauth/views/home_view.dart';
import 'package:phoneauth/views/welcome.dart';

import '../services/auth_services.dart';
import '../services/provider.dart';

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthServices auth = Provider.of(context)!.auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomeView() : WelcomePage();
        }
        return Container();
      },
    );
  }
}
