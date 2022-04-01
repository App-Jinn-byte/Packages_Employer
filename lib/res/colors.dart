import 'dart:ui';

class AppColors {
  static final Color white = HexColor.fromHex("#FFFFFF");
  static final Color blue = HexColor.fromHex("#077AC5");
  static final Color darkBlue = HexColor.fromHex("#115599");
  static final Color lightBlack = HexColor.fromHex("#404040");
  static final Color black = HexColor.fromHex("#1C2826");
  static final Color pmOpeningHourTextColor = HexColor.fromHex("#DCDCDC");
  static final Color notificationTextColor = HexColor.fromHex("#8D8D8D");



  static const pmLinearColorOne = Color.fromRGBO(7, 122, 197, 1);
  static const pmLinearColorTwo = Color.fromRGBO(19, 80, 147, 1);
  static const cardShadowColor = Color.fromRGBO(0, 0, 0, 0.12);
  static const pmTextFieldBorderColor = Color.fromRGBO(7, 122, 197, 0.61);
  static const pmTextFieldBorderShadowColor = Color.fromRGBO(0, 0, 0, 0.06);
  static const pmSearchBarTextColor = Color.fromRGBO(100, 100, 100, 1);

  //
}


extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}