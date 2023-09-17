import 'package:flutter/material.dart' show Color;
import 'package:bulby/modules/const/color/colors.dart' show darkBlue, white;

class ColorTextTag {
  const ColorTextTag({
    required this.background,
    required this.redBorder,
    required this.purpleBorder,
    required this.blueBorder,
    required this.grayBorder,
    required this.redText,
    required this.purpleText,
    required this.blueText,
    required this.grayText,
    required this.grayBackGround,
  });

  /// タグの背景色
  final Color background;

  /// タグの色 枠線 red
  final Color redBorder;

  /// タグの色 枠線 purple
  final Color purpleBorder;

  /// タグの色 枠線 blue
  final Color blueBorder;

  /// タグの色 枠線 gray
  final Color grayBorder;

  /// タグの色 red
  final Color redText;

  /// タグの色 purple
  final Color purpleText;

  /// タグの色 blue
  final Color blueText;

  /// タグの色 gray
  final Color grayText;

  /// タグの色 背景 gray
  final Color grayBackGround;
}

ColorTextTag colorTextTag(bool isDark) {
  background() {
    if (isDark) return ConstantColorTextTagDark.background;
    return ConstantColorTextTagLight.background;
  }

  redBorder() {
    if (isDark) return ConstantColorTextTagDark.redBorder;
    return ConstantColorTextTagLight.redBorder;
  }

  purpleBorder() {
    if (isDark) return ConstantColorTextTagDark.purpleBorder;
    return ConstantColorTextTagLight.purpleBorder;
  }

  blueBorder() {
    if (isDark) return ConstantColorTextTagDark.blueBorder;
    return ConstantColorTextTagLight.blueBorder;
  }

  grayBorder() {
    if (isDark) return ConstantColorTextTagDark.grayBorder;
    return ConstantColorTextTagLight.grayBorder;
  }

  redText() {
    if (isDark) return ConstantColorTextTagDark.redText;
    return ConstantColorTextTagLight.redText;
  }

  purpleText() {
    if (isDark) return ConstantColorTextTagDark.purpleText;
    return ConstantColorTextTagLight.purpleText;
  }

  blueText() {
    if (isDark) return ConstantColorTextTagDark.blueText;
    return ConstantColorTextTagLight.blueText;
  }

  grayText() {
    if (isDark) return ConstantColorTextTagDark.grayText;
    return ConstantColorTextTagLight.grayText;
  }

  grayBackGround() {
    if (isDark) return ConstantColorTextTagDark.grayBackGround;
    return ConstantColorTextTagLight.grayBackGround;
  }

  return ColorTextTag(
    background: background(),
    redBorder: redBorder(),
    purpleBorder: purpleBorder(),
    blueBorder: blueBorder(),
    grayBorder: grayBorder(),
    redText: redText(),
    purpleText: purpleText(),
    blueText: blueText(),
    grayText: grayText(),
    grayBackGround: grayBackGround(),
  );
}

/// 用途ごとに色を定義する: タグの色: ダークモード
class ConstantColorTextTagDark {
  ConstantColorTextTagDark._();

  /// タグの背景色
  static const Color background = darkBlue;

  /// タグの色 枠線 red
  static const Color redBorder = Color.fromARGB(255, 201, 98, 141);

  /// タグの色 枠線 purple
  static const Color purpleBorder = Color.fromARGB(255, 152, 83, 194);

  /// タグの色 枠線 blue
  static const Color blueBorder = Color.fromARGB(255, 88, 111, 186);

  /// タグの色 枠線 gray
  static const Color grayBorder = Color.fromARGB(255, 81, 86, 98);

  /// タグの色 red
  static const Color redText = Color.fromARGB(255, 234, 151, 186);

  /// タグの色 purple
  static const Color purpleText = Color.fromARGB(255, 202, 151, 234);

  /// タグの色 blue
  static const Color blueText = Color.fromARGB(255, 151, 170, 234);

  /// タグの色 gray
  static const Color grayText = white;

  /// タグの色 背景 gray
  static const Color grayBackGround = Color.fromARGB(255, 51, 57, 67);
}

/// 用途ごとに色を定義する: タグの色: ダークモード
class ConstantColorTextTagLight {
  ConstantColorTextTagLight._();

  /// タグの背景色
  static const Color background = darkBlue;

  /// タグの色 枠線 red
  static const Color redBorder = Color.fromARGB(255, 201, 98, 141);

  /// タグの色 枠線 purple
  static const Color purpleBorder = Color.fromARGB(255, 152, 83, 194);

  /// タグの色 枠線 blue
  static const Color blueBorder = Color.fromARGB(255, 88, 111, 186);

  /// タグの色 枠線 gray
  static const Color grayBorder = Color.fromARGB(255, 81, 86, 98);

  /// タグの色 red
  static const Color redText = Color.fromARGB(255, 234, 151, 186);

  /// タグの色 purple
  static const Color purpleText = Color.fromARGB(255, 202, 151, 234);

  /// タグの色 blue
  static const Color blueText = Color.fromARGB(255, 151, 170, 234);

  /// タグの色 gray
  static const Color grayText = white;

  /// タグの色 背景 gray
  static const Color grayBackGround = Color.fromARGB(255, 51, 57, 67);
}
