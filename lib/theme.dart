import 'package:flutter/material.dart';

Color primary = Colors.black;
Color secondary = Colors.grey.shade400;

BoxDecoration shadowdecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: const [
    BoxShadow(
        color: Color(
          0x3f000000,
        ), //New
        blurRadius: 1.0,
        offset: Offset(0, 0))
  ],
);
