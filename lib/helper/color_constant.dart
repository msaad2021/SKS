import 'app_export.dart';

class ColorConstant {
  static Color black90090 = fromHex('#90000000');

  static Color whiteA70090 = fromHex('#90ffffff');

  static Color lightBlue500 = fromHex('#00a3ff');

  static Color red400 = fromHex('#e56353');

  static Color black9003f = fromHex('#3f000000');

  static Color black90087 = fromHex('#87000000');

  static Color teal300 = fromHex('#50cd89');

  static Color teal500 = fromHex('#00b383');

  static Color blueA20066 = fromHex('#663598ff');

  static Color lightBlueA700 = fromHex('#0095ff');

  static Color deepPurpleA200 = fromHex('#735bf2');

  static Color redA700 = fromHex('#ff0000');

  static Color gray50 = fromHex('#EDEDED');

  static Color gray600 = fromHex('#757575');

  static Color gray400 = fromHex('#c7c7c7');

  static Color blue700 = fromHex('#288ec6');

  static Color redA200 = fromHex('#f64e60');

  static Color gray200 = fromHex('#ececec');

  static Color black90099 = fromHex('#99000000');

  static Color bluegray400 = fromHex('#8e8e8e');

  static Color cyan50 = fromHex('#d6fdff');

  static Color gray40087 = fromHex('#87bebebe');

  static Color whiteA700 = fromHex('#ffffff');

  static Color cyan400 = fromHex('#2fced7');

  static Color bluegray10075 = fromHex('#75d9d9d9');

  static Color red100 = fromHex('#ffd4d9');

  static Color red50 = fromHex('#fcefee');

  static Color green400 = fromHex('#54d989');

  static Color lightBlue800 = fromHex('#0073cc');

  static Color blue80028 = fromHex('#281a74b7');

  static Color black900 = fromHex('#000000');

  static Color lightGreen500 = fromHex('#78c34c');

  static Color gray909 = fromHex('#222222');

  static Color gray70099 = fromHex('#995b5b5b');

  static Color black90026 = fromHex('#26000000');

  static Color gray700 = fromHex('#595959');

  static Color black900A2 = fromHex('#a2000000');

  static Color blue801 = fromHex('#1b74b8');

  static Color gray103 = fromHex('#f4f5f7');

  static Color amber400 = fromHex('#ffcd29');

  static Color blue800 = fromHex('#1a74b7');

  static Color black9006c = fromHex('#6c000000');

  static Color gray900 = fromHex('#1d1d1d');

  static Color bluegray100 = fromHex('#d2d2d2');

  static Color teal51 = fromHex('#dcfdeb');

  static Color teal50 = fromHex('#d1e3f1');

  static Color gray101 = fromHex('#f3f3f3');

  static Color gray102 = fromHex('#eefbf3');

  static Color gray300 = fromHex('#e1e1e1');

  static Color gray100 = fromHex('#f7f7f7');

  static Color bluegray900 = fromHex('#222b45');

  static Color black90075 = fromHex('#75000000');

  static Color black900Cc = fromHex('#cc000000');

  static Color bluegray300 = fromHex('#8f9bb3');

  static Color bluegray101 = fromHex('#cecece');

  static Color amber40028 = fromHex('#28ffcd29');

  static Color blue400 = fromHex('#3699ff');

  static Color gray90090 = fromHex('#901d1d1d');

  static Color bookingsColor = fromHex('#60b7ff');

  static Color teamColor = fromHex('#ff507d');

  static Color notesColor = fromHex('#ecce93');

  static Color attendaceColor = fromHex('#474646');

  static Color leaveColor = fromHex('#95d6a4');

  static Color approvedGreen = fromHex('#54DA8A');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
