import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData DarkeThme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFFFFFFFF),
      unselectedItemColor: Colors.white60,
      selectedIconTheme: IconThemeData(size: 40),
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white60,
        fontSize: 25,
      ),
    ),
  );
}
