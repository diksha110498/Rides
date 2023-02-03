/*
 *  @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *  @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 *  All Rights Reserved.
 *  Proprietary and confidential :  All information contained herein is, and remains
 *  the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import '../export.dart';

double? size;
Color? color;

ThemeData themeData = new ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.white,

  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headline1: TextStyle(
        color: color ?? Colors.black,
        fontSize:  18.0,
        fontWeight: FontWeight.w500),
    headline2: TextStyle(
        color: color ?? Colors.black,
        fontSize:15.0,
        fontWeight: FontWeight.bold)
  )
);

ThemeData themeDataDark = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  backgroundColor: Colors.black,
    textTheme: TextTheme(
        headline1: TextStyle(
            color: color ?? Colors.black,
            fontSize:  18.0,
            fontWeight: FontWeight.w500),
        headline2: TextStyle(
            color: color ?? Colors.black,
            fontSize:15.0,
            fontWeight: FontWeight.bold)
    )
);
