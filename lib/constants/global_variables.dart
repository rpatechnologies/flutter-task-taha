import 'package:flutter/material.dart';

// String uri = 'http://<your ip address>:3000';
String uri = 'https://amazon-clone-server-tahasiddiqui.onrender.com';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 247, 250, 250),
      Color.fromARGB(255, 242, 246, 246),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const blackText = Colors.black;
}
