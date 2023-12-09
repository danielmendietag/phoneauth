import 'package:phoneauth/services/auth_services.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final AuthServices auth;
  final db;

  Provider(@required this.auth, @required this.db, {required super.child});



  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider? of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>());
}
