import 'package:flutter/material.dart';

import 'hex_color.dart';

class AppColors {
  static Color primary = HexColor('#009FE3');
  static Color secondPrimary = HexColor('#252C31');
  static Color red = HexColor('#EF5667');
  static Color green = HexColor('#14CE7F');
  static Color lightWhite = HexColor('#F2F5F7');
  static Color lightBlue1 = HexColor('#E1EDF2');
  static Color  lightBlue2= HexColor('#D2E1E8');
  static Color samawy = HexColor('#B1C9D3');
  static Color grey = HexColor('#7B9AA7');
  static Color lbny = HexColor('#A1DAF8');
  static Color yellow = HexColor('#FFCC23');
  static Color blue = HexColor('#003B64');
  static Color white = Colors.white;
  
  // static Color red = HexColor('#FF0000');
  static Color black = Colors.black;
  static Color blackLite = Colors.black12;
  static Color success = Colors.green;

  static Color error = Colors.red;
  static Color transparent = Colors.transparent;

  static Color gray = Colors.grey;

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lightens(String color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(HexColor(color));
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
