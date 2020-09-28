import 'package:flutter/material.dart';
//渐变色
  var myGradientColor = BoxDecoration(
    gradient: LinearGradient(colors: [
      Color(0xff0ec5c9),
      Color(0xff54eb9e),
    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
  );