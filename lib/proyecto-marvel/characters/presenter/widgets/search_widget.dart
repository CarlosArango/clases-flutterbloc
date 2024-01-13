import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: ShapeDecoration(
        color: const Color(0xFFEFEEEE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Buscar',
          hintStyle: TextStyle(
            fontSize: 17,
            color: Color(0xFF99999D),
          ),
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontStyle: FontStyle.italic,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w200,
          ),
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.only(
              top: 15,
              start: 40,
              end: 16,
            ),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 33,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
            top: 18,
          ),
        ),
      ),
    );
  }
}
