import 'package:flutter/material.dart';

// #1D1D1D
// #0E0E0E

const _appBarColor = Color(0xFF0E0E0E);
const _scaffoldBackgroundColor = Color(0xFF1D1D1D);

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: _appBarColor,
    titleTextStyle: textTheme.headlineMedium,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: textTheme,
  scaffoldBackgroundColor: _scaffoldBackgroundColor,
);

final textTheme = TextTheme(
  headlineMedium: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  ),
  titleMedium: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.grey[400],
  ),
);
