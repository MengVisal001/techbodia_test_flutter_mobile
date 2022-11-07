import 'package:flutter/material.dart';

class AppColors {
  Color primary = HexColor.fromHex('#2E3336');
  Color primaryOpacity = HexColor.fromHex('#40484D');
  Color secondary = HexColor.fromHex('#FFFFFF');
  Color buttonColor = HexColor.fromHex('#EEDDE7');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; // 8 character with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
