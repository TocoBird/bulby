import 'package:flutter/material.dart' show Color;
import 'package:bulby/modules/const/color/colors.dart'
    show darkBlue, darkBlueLittle, white, grayDark, grayLight;

class ColorBase {
  const ColorBase({
    required this.header,
    required this.footer,
    required this.content,
    required this.box,
    required this.boxBorder,
    required this.boxComment,
    required this.boxCommentBorder,
    required this.text,
    required this.textBold,
    required this.textOpacity,
    required this.taskListArrow,
    required this.icon,
    required this.iconBackGround,
    required this.iconBackGroundThin,
    required this.iconDark,
    required this.iconThin,
    required this.modalBackground,
    required this.alert,
    required this.toast,
  });

  /// ヘッダーの背景色
  final Color header;

  /// フッターの背景色
  final Color footer;

  /// コンテンツの背景色
  final Color content;

  /// ボックスの背景色
  final Color box;

  /// ボックスの枠線色
  final Color boxBorder;

  /// ボックスコメントの背景色
  final Color boxComment;

  /// ボックスコメントの枠線色
  final Color boxCommentBorder;

  /// 基本的な文字色
  final Color text;

  /// 基本的な文字色: 太字
  final Color textBold;

  /// 薄い文字
  final Color textOpacity;

  /// タスクリストの矢印の色
  final Color taskListArrow;

  /// アイコンの色
  final Color icon;

  /// アイコンの背景の円の色
  final Color iconBackGround;

  /// アイコンの背景の円の色 薄い
  final Color iconBackGroundThin;

  /// アイコンの色
  final Color iconDark;

  /// 薄いアイコンの色
  final Color iconThin;

  /// モーダルのコンテンツ後ろの背景
  final Color modalBackground;

  /// アラートの背景色
  final Color alert;

  /// トースト（ポップアップ）の背景色
  final Color toast;
}

ColorBase colorBase(bool isDark) {
  header() {
    if (isDark) return ConstantColorDark.header;
    return ConstantColorLight.header;
  }

  footer() {
    if (isDark) return ConstantColorDark.footer;
    return ConstantColorLight.footer;
  }

  content() {
    if (isDark) return ConstantColorDark.content;
    return ConstantColorLight.content;
  }

  box() {
    if (isDark) return ConstantColorDark.box;
    return ConstantColorLight.box;
  }

  boxBorder() {
    if (isDark) return ConstantColorDark.boxBorder;
    return ConstantColorLight.boxBorder;
  }

  boxComment() {
    if (isDark) return ConstantColorDark.boxComment;
    return ConstantColorLight.boxComment;
  }

  boxCommentBorder() {
    if (isDark) return ConstantColorDark.boxCommentBorder;
    return ConstantColorLight.boxCommentBorder;
  }

  text() {
    if (isDark) return ConstantColorDark.text;
    return ConstantColorLight.text;
  }

  textBold() {
    if (isDark) return ConstantColorDark.textBold;
    return ConstantColorLight.textBold;
  }

  textOpacity() {
    if (isDark) return ConstantColorDark.textOpacity;
    return ConstantColorLight.textOpacity;
  }

  taskListArrow() {
    if (isDark) return ConstantColorDark.taskListArrow;
    return ConstantColorLight.taskListArrow;
  }

  icon() {
    if (isDark) return ConstantColorDark.icon;
    return ConstantColorLight.icon;
  }

  iconBackGround() {
    if (isDark) return ConstantColorDark.iconBackGround;
    return ConstantColorLight.iconBackGround;
  }

  iconBackGroundThin() {
    if (isDark) return ConstantColorDark.iconBackGroundThin;
    return ConstantColorLight.iconBackGroundThin;
  }

  iconDark() {
    if (isDark) return ConstantColorDark.iconDark;
    return ConstantColorLight.iconDark;
  }

  iconThin() {
    if (isDark) return ConstantColorDark.iconThin;
    return ConstantColorLight.iconThin;
  }

  modalBackground() {
    if (isDark) return ConstantColorDark.modalBackground;
    return ConstantColorLight.modalBackground;
  }

  alert() {
    if (isDark) return ConstantColorDark.alert;
    return ConstantColorLight.alert;
  }

  toast() {
    if (isDark) return ConstantColorDark.toast;
    return ConstantColorLight.toast;
  }

  return ColorBase(
    header: header(),
    footer: footer(),
    content: content(),
    box: box(),
    boxBorder: boxBorder(),
    boxComment: boxComment(),
    boxCommentBorder: boxCommentBorder(),
    text: text(),
    textBold: textBold(),
    textOpacity: textOpacity(),
    taskListArrow: taskListArrow(),
    icon: icon(),
    iconBackGround: iconBackGround(),
    iconBackGroundThin: iconBackGroundThin(),
    iconDark: iconDark(),
    iconThin: iconThin(),
    modalBackground: modalBackground(),
    alert: alert(),
    toast: toast(),
  );
}

/// 基本的な色: ダークモード
class ConstantColorDark {
  ConstantColorDark._();

  /// ヘッダーの背景色
  static const Color header = darkBlueLittle;

  /// フッターの背景色
  static const Color footer = darkBlueLittle;

  /// コンテンツの背景色
  static const Color content = darkBlue;

  /// 基本的な文字色
  static const Color text = white;

  /// 基本的な文字色: 太字
  static const Color textBold = Color.fromARGB(180, 255, 255, 255);

  /// 薄い文字
  static const Color textOpacity = Color.fromARGB(120, 255, 255, 255);

  /// ボックスの背景色
  static const Color box = grayDark;

  /// ボックスの枠線色
  static const Color boxBorder = Color.fromARGB(255, 46, 52, 65);

  /// ボックスコメントの背景色
  static const Color boxComment = Color.fromARGB(255, 47, 45, 62);

  /// ボックスコメントの枠線色
  static const Color boxCommentBorder = Color.fromARGB(255, 187, 192, 214);

  /// タスクリストの矢印の色
  static const Color taskListArrow = Color.fromARGB(55, 255, 255, 255);

  /// アイコンの色
  static const Color icon = Color.fromARGB(200, 255, 255, 255);

  /// アイコンの背景の円の色
  static const Color iconBackGround = Color.fromARGB(110, 255, 255, 255);

  /// アイコンの背景の円の色 薄い
  static const Color iconBackGroundThin = Color.fromARGB(55, 255, 255, 255);

  /// アイコンの色
  static const Color iconDark = Color.fromARGB(199, 26, 26, 55);

  /// 薄いアイコンの色
  static const Color iconThin = Color.fromARGB(160, 255, 255, 255);

  /// モーダルのコンテンツ後ろの背景
  static const Color modalBackground = Color.fromARGB(180, 0, 0, 0);

  /// アラートの背景色
  static const Color alert = Color.fromARGB(230, 200, 80, 135);

  /// トースト（ポップアップ）の背景色
  static const Color toast = Color.fromARGB(230, 76, 76, 130);
}

/// 基本的な色: ライトモード
class ConstantColorLight {
  ConstantColorLight._();

  /// ヘッダーの背景色
  static const Color header = Color.fromARGB(180, 255, 255, 255);

  /// フッターの背景色
  static const Color footer = Color.fromARGB(180, 255, 255, 255);

  /// コンテンツの背景色
  static const Color content = Color.fromARGB(180, 242, 242, 245);

  /// 基本的な文字色
  static const Color text = Color.fromARGB(255, 16, 18, 46);

  /// 基本的な文字色
  static const Color textBold = Color.fromARGB(180, 255, 255, 255);

  /// 薄い文字
  static const Color textOpacity = Color.fromARGB(120, 255, 255, 255);

  /// ボックスの背景色
  static const Color box = Color.fromARGB(255, 239, 239, 239);

  /// ボックスの枠線色
  static const Color boxBorder = grayLight;

  /// ボックスコメントの背景色
  static const Color boxComment = Color.fromARGB(255, 239, 239, 239);

  /// ボックスコメントの枠線色
  static const Color boxCommentBorder = grayLight;

  /// タスクリストの矢印の色
  static const Color taskListArrow = Color.fromARGB(55, 255, 255, 255);

  /// アイコンの色
  static const Color icon = Color.fromARGB(200, 255, 255, 255);

  /// アイコンの背景の円の色
  static const Color iconBackGround = Color.fromARGB(110, 255, 255, 255);

  /// アイコンの背景の円の色 薄い
  static const Color iconBackGroundThin = Color.fromARGB(55, 255, 255, 255);

  /// アイコンの色
  static const Color iconDark = Color.fromARGB(199, 26, 26, 55);

  /// 薄いアイコンの色
  static const Color iconThin = Color.fromARGB(160, 255, 255, 255);

  /// モーダルのコンテンツ後ろの背景
  static const Color modalBackground = Color.fromARGB(180, 0, 0, 0);

  /// アラートの背景色
  static const Color alert = Color.fromARGB(230, 200, 80, 135);

  /// トースト（ポップアップ）の背景色
  static const Color toast = Color.fromARGB(230, 76, 76, 130);
}
