import 'package:flutter/material.dart';

class Appcolors {
  static const Color blackApp = Color(0xff110F24);
  static const Color redApp = Color(0xffCB2127);
  static const Color darkBlue = Color(0xFF1C274C);

  static const Color orange = Color(0xffEE733A);

  static const Color notificationTileColor = Color(0xffFCECEF);
  static const Color notificationIndicatorColor = Color(0xffE6405E);

  static const Color red = Color(0xFFE7455C);
  static const Color scaffoldbackgroundColor = Color(0xFFF0F0F0);
  static const Color blueApp = Color(0xFF1C79BC);
  static const Color fieldsBlue = Color(0xFF1D79BC);

  static const Color clearRedApp = Color(0xFFFAE9E9);

  //Gray
  static const Color backgroundColor = Color(0xffF2F7F6);
  static const Color labelTextColor = Color(0xFF8F9092);
  static const Color grey2 = Color(0xff8B8A8A);
  static const Color grey3 = Color(0xFFE0E7ED);
  static const Color grey14 = Color(0xffA4A4A4);
  static const Color grey19 = Color(0xFFBFBFBF);
  static const Color grey21 = Color(0xFFF6F6F6);
  static const Color grey22 = Color(0xFFD9D9D9);
  static const Color grey23 = Color(0xFFF7F7F7);
  static const Color grey24 = Color(0xFFD5D4D4);
  static const Color grey26 = Color(0xFF6E6E6E);

  static const Color grey25 = Color(0xFFD9D9D9);
  static const Color grey27 = Color(0xFF747474);

//Yellow

  static const Color yellow6 = Color(0xFFFAC739);
  static const Color yelloApp = Color(0xffF9EC26);
  static const Color mainYellow = Color(0xffF9EC26);
  static const Color yellow1 = Color(0xFFFAC500);

  static const Color purple7 = Color(0xff5458F7);

  static const green4 = Color(0xff00CC99);
  static const green5 = Color(0xFF17ADA4);
  static const green6 = Color(0xff469e7e);

  static const green1 = Color(0xFF17AD26);

  //RED
  static const red1 = Color(0xffD61523);
  static const red2 = Color(0xffEB5757);
  static const red3 = Color(0xFFFF5761);

  // White
  static const white = Color(0xffffffff);

  //Black

  static const black = Colors.black;
  static const black3 = Color(0xff2F3032);

  static Gradient commonGradiantColor() {
    return const LinearGradient(
      end: Alignment(1.00, 0.00),
      begin: Alignment(-1, 0),
      colors: [Appcolors.notificationIndicatorColor, Appcolors.yellow1],
    );
  }

  static Gradient menuGradiantColor() {
    return const RadialGradient(
      center: Alignment(1.00, 0.00),
      focal: Alignment(-1, 0),
      colors: [Appcolors.notificationIndicatorColor, Appcolors.yellow1
      ],
    );
  }

  static Gradient commonBackgroundBodyGradiantColor() {
    return const LinearGradient(
      begin: Alignment(0.00, -1.00),
      end: Alignment(0, 1),
      colors: [Colors.black, Color(0xFFBE5A68)],
    );
  }

  static const List<Color> listColorsPrimaries = <Color>[
    Color(0xFF3D9BB7),
    Color(0xFF063C98),
    Color(0xFFE75F0B),
    Color(0xFF864E02),
    Color(0xFFFA1717),
    Color(0xFFB69700),
    Color(0xFFFA9C1E),
    Color(0xFFE0BA3E),
    Color(0xFF236F8A),
    Color(0xFF0B324B),
    Color(0xFF185B01),
    Color(0xFFC53535),
    Color(0xFF2DA600),
    Color(0xFFD72828),
    Color(0xFF2D4D00)
  ];
}