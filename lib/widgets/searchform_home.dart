import 'package:flutter/material.dart';

class SearchFormHome extends StatelessWidget {
  const SearchFormHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Container(
        width: 350,
        height: 57,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
            color: const Color(0xFFF5F5F5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(73))),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(73),
              borderSide: BorderSide.none,
            ),
            suffixIcon: Icon(Icons.search),
            hintText: 'eg: Mountain, Florest',
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B6B6B),
              fontFamily: 'Muli',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
