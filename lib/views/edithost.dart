import 'package:flutter/material.dart';
import 'package:phoneauth/widgets/main_drawer.dart';

class EditHost extends StatefulWidget {
  const EditHost({super.key});

  @override
  State<EditHost> createState() => _EditHostState();
}

class _EditHostState extends State<EditHost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(),
    );
  }
}
