import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFFFFFFFF),
      unselectedItemColor: Colors.white60,
      selectedIconTheme: IconThemeData(size: 40),
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white60,
        fontSize: 25,
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFFFFFFFF),
      unselectedItemColor: Colors.white60,
      selectedIconTheme: IconThemeData(size: 50),
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white60,
        fontSize: 25,
      ),
    ),
  );
}
