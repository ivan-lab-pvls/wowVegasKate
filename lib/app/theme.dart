import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const theme = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: scaffoldColor,
  barBackgroundColor: scaffoldColor,
  textTheme: CupertinoTextThemeData(
    navActionTextStyle: TextStyle(
      color: orangeColor,
      fontSize: 17,
      inherit: false,
    ),
  ),
);

const primaryColor = Color.fromRGBO(0, 126, 255, 1);
const secondaryColor = Color.fromRGBO(152, 152, 152, 1);
const scaffoldColor = Color.fromRGBO(24, 24, 27, 1);
const surfaceColor = Color.fromRGBO(32, 32, 36, 1);
const orangeColor = Color.fromRGBO(245, 150, 13, 1);

final borderRadius = BorderRadius.circular(10.r);
