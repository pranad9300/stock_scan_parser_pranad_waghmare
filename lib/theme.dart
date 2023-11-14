import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Colors.black,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionHandleColor: Colors.black,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    contentPadding: EdgeInsets.only(left: 5),
  ),
  scaffoldBackgroundColor: const Color(0xFF01131B),
  cardColor: const Color(0xff1686b0),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      color: Color.fromRGBO(68, 88, 128, 1),
    ),
  ),
  listTileTheme: const ListTileThemeData(
    shape: Border(
      bottom: BorderSide(
        color: Color(0xFF01131B),
        width: 2.0,
        style: BorderStyle.solid,
      ),
    ),
    titleTextStyle: TextStyle(
      fontSize: 14,
      color: Colors.white,
      decoration: TextDecoration.underline,
      decorationColor: Colors.white,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 1.0,
    ),
    subtitleTextStyle: TextStyle(
      fontSize: 10,
      decoration: TextDecoration.underline,
      decorationColor: Colors.white,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 1.0,
    ),
  ),
  useMaterial3: true,
);
