import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const String fontName = 'Prompt';
  static const FontWeight fontSizeNormal = FontWeight.normal;
  static const Color orange = Color(0xFFFF833E);

  static const Color orange2 = Color(0xFFFF6C0C);
  static const Color orange3 = Color(0xFFFF3312);
  static const Color transparent = Colors.transparent;
  static const Color lightOrange = Color(0xFFFFC49E);
  static const Color bgOrange = Color(0xFFFFE2CE);
  static const Color balloon = Color(0xFFF8A577);
  static const Color alert = Color(0xFFFF3629);
  static const Color gray10 = Color(0xFFF2F2F2);
  static const Color gray20 = Color(0xFFE6E6E6);
  static const Color gray30 = Color(0xFFCCCCCC);
  static const Color gray40 = Color(0xFFB3B3B3);
  static const Color gray50 = Color(0xFF999999);
  static const Color gray60 = Color(0xFF939393);
  static const Color gray70 = Color(0xFF666666);
  static const Color gray80 = Color(0xFF4D4D4D);
  static const Color gray90 = Color(0xFF333333);
  static const Color smokeGray = Color(0xFFDBDBDB);
  static const Color bgLane = Color(0xFFF9F9F9);
  static const Color bgLane2 = Color(0xFFFFF0E7);
  static const Color bgChatRoom = Color(0xFFf5f5f5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Colors.blue;
  static const Color moreInfo = Color(0xFF3C8BE9);
  static const Color rightMessage = Color(0xFFd2e4f0);
  static const Color purple = Color(0xFF9A6EBC);
  static const Color borderWhite = Color(0xFFB3B3B3);
  static const Color black = Colors.black;
  static const Color borderGray = Color(0xFFB3B3B3);
  static const Color complete = Color(0xFF19CD61);
  static const Color women = Color(0xFFFF758E);
  static const Color women2 = Color(0xFFFF758E);
  static const Color men = Color(0xFF3C8BE9);
  static const Color violet = Color(0xFFAF557B);
  static const Color win = Color(0xFF4fb14f);
  static const Color win2 = Color(0xff77d477);
  static const Color lose = Color(0xFFeb5a5a);
  static const Color lose2 = Color(0xffe58d8d);
  static const LinearGradient vip = LinearGradient(colors: [
    Color(0xFF262626),
    Color(0xFF4F4F4F),
    Color(0xFF858585),
  ], begin: Alignment.bottomLeft, end: Alignment.topRight);
  static const LinearGradient orangeGradient = LinearGradient(
    colors: [orange2, orange3],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient orangeGradientAppBar = LinearGradient(
    colors: [orange2, orange3],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient winGradient = LinearGradient(
    colors: [win, win2],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient loseGradient = LinearGradient(
    colors: [lose, lose2],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient disable = LinearGradient(
    colors: [gray20, gray20],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color bgNoti = Color(0xFFFFF2EB);
  static const Color ultraMarine = Color(0xFF4F53B6);
  static const Color greenAqua = Color(0xFF0DB5A0);
  static const Color green = Color(0xFF4FB6B2);
  static const Color yellow = Color(0xFFFECD1F);
  static const Color darkRed = Color(0xFF94000B);

  static const Color navyCus = Color(0xFF2151c5);
  static const Color blueCus = Color(0xFF48a0bc);
  static const Color greenCus = Color(0xFF3b855d);
  static const Color yellowCus = Color(0xFFf19e41);
  static const Color redCus = Color(0xFFcc4425);
  static const Color purpleCus = Color(0xFF5044a4);
  static const Color blackCus = Color(0xFF000000);
  static const Color facebook = Color(0xFF4267B2);
  static const Color line = Color(0xFF00B900);

  static Map<String, dynamic> listOpportuneLv = {
    '00': {'name': 'เริ่มต้น', 'color': AppTheme.gray70},
    '01': {'name': 'น้อย', 'color': AppTheme.navyCus},
    '02': {'name': 'กลาง', 'color': AppTheme.yellow},
    '03': {'name': 'มาก', 'color': AppTheme.alert},
  };
}
