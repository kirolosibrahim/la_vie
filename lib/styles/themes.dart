import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:la_vie/shared/components/constants.dart';

import 'colors.dart';

dynamic primarySwatchColor = buildMaterialColor(primaryColor);

ThemeData darkTheme = ThemeData(
  primarySwatch: primarySwatchColor,
  scaffoldBackgroundColor: primaryDarkColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: primaryDarkColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: primaryDarkColor,
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: primaryDarkColor,
  ),
  textTheme: const TextTheme(

    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.3,
    ),

  ),
  fontFamily: 'Roboto',
);

ThemeData lightTheme = ThemeData(
  primarySwatch: primarySwatchColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),

  textTheme:  const TextTheme(

    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.3,
    ),
  ),
  fontFamily: 'Roboto',

);
