import 'package:flutter/material.dart' show Color;
import 'package:gamer_reflection/modules/const/color/colors.dart'
    show darkBlue, blue;

class ColorButton {
  const ColorButton({
    required this.basic,
    required this.basicThin,
    required this.basicBorder,
    required this.basicBorderThin,
    required this.thin,
    required this.thinBorder,
    required this.thinActive,
    required this.thinActiveBorder,
    required this.done,
    required this.doneDisable,
    required this.doneBorder,
    required this.doneBorderDisable,
    required this.cancel,
    required this.cancelBorder,
    required this.radio,
    required this.radioBorder,
    required this.radioBorderActive,
    required this.delete,
    required this.deleteBorder,
    required this.period,
    required this.periodActive,
    required this.periodBorder,
    required this.taskList,
    required this.taskListThin,
    required this.taskListBorder,
    required this.radioCircleActive,
    required this.radioCircleDisable,
  });

  final List<Color> basic;
  final List<Color> basicThin;
  final Color basicBorder;
  final Color basicBorderThin;
  final Color thin;
  final Color thinBorder;
  final Color thinActive;
  final Color thinActiveBorder;
  final List<Color> done;
  final Color doneDisable;
  final Color doneBorder;
  final Color doneBorderDisable;
  final Color cancel;
  final Color cancelBorder;
  final Color radio;
  final Color radioBorder;
  final Color radioBorderActive;
  final Color delete;
  final Color deleteBorder;
  final Color period;
  final Color periodActive;
  final Color periodBorder;
  final Color taskList;
  final Color taskListThin;
  final Color taskListBorder;
  final Color radioCircleActive;
  final Color radioCircleDisable;
}

ColorButton colorButton(bool isDark) {
  return ColorButton(
    basic:
        isDark ? ConstantColorButtonDark.basic : ConstantColorButtonLight.basic,
    basicThin: isDark
        ? ConstantColorButtonDark.basicThin
        : ConstantColorButtonLight.basicThin,
    basicBorder: isDark
        ? ConstantColorButtonDark.basicBorder
        : ConstantColorButtonLight.basicBorder,
    basicBorderThin: isDark
        ? ConstantColorButtonDark.basicBorderThin
        : ConstantColorButtonLight.basicBorderThin,
    thin: isDark ? ConstantColorButtonDark.thin : ConstantColorButtonLight.thin,
    thinBorder: isDark
        ? ConstantColorButtonDark.thinBorder
        : ConstantColorButtonLight.thinBorder,
    thinActive: isDark
        ? ConstantColorButtonDark.thinActive
        : ConstantColorButtonLight.thinActive,
    thinActiveBorder: isDark
        ? ConstantColorButtonDark.thinActiveBorder
        : ConstantColorButtonLight.thinActiveBorder,
    done: isDark ? ConstantColorButtonDark.done : ConstantColorButtonLight.done,
    doneDisable: isDark
        ? ConstantColorButtonDark.doneDisable
        : ConstantColorButtonLight.doneDisable,
    doneBorder: isDark
        ? ConstantColorButtonDark.doneBorder
        : ConstantColorButtonLight.doneBorder,
    doneBorderDisable: isDark
        ? ConstantColorButtonDark.doneBorderDisable
        : ConstantColorButtonLight.doneBorderDisable,
    cancel: isDark
        ? ConstantColorButtonDark.cancel
        : ConstantColorButtonLight.cancel,
    cancelBorder: isDark
        ? ConstantColorButtonDark.cancelBorder
        : ConstantColorButtonLight.cancelBorder,
    radio:
        isDark ? ConstantColorButtonDark.radio : ConstantColorButtonLight.radio,
    radioBorder: isDark
        ? ConstantColorButtonDark.radioBorder
        : ConstantColorButtonLight.radioBorder,
    radioBorderActive: isDark
        ? ConstantColorButtonDark.radioBorderActive
        : ConstantColorButtonLight.radioBorderActive,
    delete: isDark
        ? ConstantColorButtonDark.delete
        : ConstantColorButtonLight.delete,
    deleteBorder: isDark
        ? ConstantColorButtonDark.deleteBorder
        : ConstantColorButtonLight.deleteBorder,
    period: isDark
        ? ConstantColorButtonDark.period
        : ConstantColorButtonLight.period,
    periodActive: isDark
        ? ConstantColorButtonDark.periodActive
        : ConstantColorButtonLight.periodActive,
    periodBorder: isDark
        ? ConstantColorButtonDark.periodBorder
        : ConstantColorButtonLight.periodBorder,
    taskList: isDark
        ? ConstantColorButtonDark.taskList
        : ConstantColorButtonLight.taskList,
    taskListThin: isDark
        ? ConstantColorButtonDark.taskListThin
        : ConstantColorButtonLight.taskListThin,
    taskListBorder: isDark
        ? ConstantColorButtonDark.taskListBorder
        : ConstantColorButtonLight.taskListBorder,
    radioCircleActive: isDark
        ? ConstantColorButtonDark.radioCircleActive
        : ConstantColorButtonLight.radioCircleActive,
    radioCircleDisable: isDark
        ? ConstantColorButtonDark.radioCircleDisable
        : ConstantColorButtonLight.radioCircleDisable,
  );
}

/// 用途ごとに色を定義する: ボタンの色: ダークモード
class ConstantColorButtonDark {
  ConstantColorButtonDark._();

  /// ボタン: 背景色
  static const List<Color> basic = [
    Color.fromARGB(255, 44, 46, 117),
    Color.fromARGB(255, 43, 29, 104),
  ];

  /// ボタン: 背景色 薄い
  static const List<Color> basicThin = [
    Color.fromARGB(150, 37, 39, 93),
    Color.fromARGB(148, 44, 37, 93),
  ];

  /// ボタン: 枠線色
  static const Color basicBorder = blue;

  /// ボタン: 枠線色 薄い
  static const Color basicBorderThin = Color.fromARGB(150, 38, 43, 114);

  /// 薄いボタン: 背景色
  static const Color thin = Color.fromARGB(255, 8, 8, 13);

  /// 薄いボタン: 枠線色
  static const Color thinBorder = Color.fromARGB(255, 35, 39, 77);

  /// 薄いボタン: アクティブ状態の背景色
  static const Color thinActive = Color.fromARGB(255, 43, 47, 56);

  /// 薄いボタン: アクティブ状態の枠線色
  static const Color thinActiveBorder = Color.fromARGB(255, 68, 79, 118);

  /// 完了ボタン: 背景色
  static const List<Color> done = [
    Color.fromARGB(255, 79, 125, 85),
    Color.fromARGB(255, 44, 98, 51),
  ];

  /// 完了ボタン: 背景色 非選択状態
  static const Color doneDisable = Color.fromARGB(255, 98, 123, 100);

  /// 完了ボタン: 枠線色
  static const Color doneBorder = Color.fromARGB(255, 85, 148, 97);

  /// 完了ボタン: 枠線色 非選択状態
  static const Color doneBorderDisable = Color.fromARGB(255, 61, 109, 70);

  /// キャンセルボタン: 背景色
  static const Color cancel = Color.fromARGB(255, 94, 94, 103);

  /// キャンセルボタン: 枠線色
  static const Color cancelBorder = Color.fromARGB(255, 122, 122, 131);

  /// ラジオボタン: 背景色
  static const Color radio = Color.fromARGB(255, 29, 33, 50);

  /// ラジオボタン: 枠線色
  static const Color radioBorder = Color.fromARGB(255, 40, 44, 98);

  /// ラジオボタン: 枠線色アクティブ
  static const Color radioBorderActive = blue;

  /// 削除ボタン: 背景色
  static const Color delete = Color.fromARGB(255, 132, 51, 51);

  /// 削除ボタン: 枠線色
  static const Color deleteBorder = Color.fromARGB(255, 157, 87, 87);

  /// 期間選択ボタン: 背景色
  static const Color period = darkBlue;

  /// 期間選択ボタン: 背景色 アクティブ時
  static const Color periodActive = Color.fromARGB(255, 35, 35, 106);

  /// 期間選択ボタン: 枠線色
  static const Color periodBorder = blue;

  /// タスク一覧ボタン: 背景色: 濃い
  static const Color taskList = Color.fromARGB(255, 26, 27, 31);

  /// タスク一覧ボタン: 背景色: 薄い
  static const Color taskListThin = Color.fromARGB(255, 43, 47, 56);

  /// タスク一覧ボタン: 枠線色
  static const Color taskListBorder = Color.fromARGB(255, 67, 69, 82);

  /// ラジオボタン: アクティブ
  static const Color radioCircleActive = Color.fromARGB(255, 93, 168, 103);

  /// ラジオボタン: 非アクティブ
  static const Color radioCircleDisable = Color.fromARGB(255, 40, 40, 40);
}

/// 用途ごとに色を定義する: ボタンの色: ダークモード
class ConstantColorButtonLight {
  ConstantColorButtonLight._();

  /// ボタン: 背景色
  static const List<Color> basic = [
    Color.fromARGB(255, 44, 46, 117),
    Color.fromARGB(255, 43, 29, 104),
  ];

  /// ボタン: 背景色 薄い
  static const List<Color> basicThin = [
    Color.fromARGB(150, 37, 39, 93),
    Color.fromARGB(148, 44, 37, 93),
  ];

  /// ボタン: 枠線色
  static const Color basicBorder = blue;

  /// ボタン: 枠線色 薄い
  static const Color basicBorderThin = Color.fromARGB(150, 38, 43, 114);

  /// 薄いボタン: 背景色
  static const Color thin = Color.fromARGB(255, 8, 8, 13);

  /// 薄いボタン: 枠線色
  static const Color thinBorder = Color.fromARGB(255, 35, 39, 77);

  /// 薄いボタン: アクティブ状態の背景色
  static const Color thinActive = Color.fromARGB(255, 43, 47, 56);

  /// 薄いボタン: アクティブ状態の枠線色
  static const Color thinActiveBorder = Color.fromARGB(255, 68, 79, 118);

  /// 完了ボタン: 背景色
  static const List<Color> done = [
    Color.fromARGB(255, 79, 125, 85),
    Color.fromARGB(255, 44, 98, 51),
  ];

  /// 完了ボタン: 背景色 非選択状態
  static const Color doneDisable = Color.fromARGB(255, 98, 123, 100);

  /// 完了ボタン: 枠線色
  static const Color doneBorder = Color.fromARGB(255, 85, 148, 97);

  /// 完了ボタン: 枠線色 非選択状態
  static const Color doneBorderDisable = Color.fromARGB(255, 61, 109, 70);

  /// キャンセルボタン: 背景色
  static const Color cancel = Color.fromARGB(255, 94, 94, 103);

  /// キャンセルボタン: 枠線色
  static const Color cancelBorder = Color.fromARGB(255, 122, 122, 131);

  /// ラジオボタン: 背景色
  static const Color radio = Color.fromARGB(255, 29, 33, 50);

  /// ラジオボタン: 枠線色
  static const Color radioBorder = Color.fromARGB(255, 40, 44, 98);

  /// ラジオボタン: 枠線色アクティブ
  static const Color radioBorderActive = blue;

  /// 削除ボタン: 背景色
  static const Color delete = Color.fromARGB(255, 132, 51, 51);

  /// 削除ボタン: 枠線色
  static const Color deleteBorder = Color.fromARGB(255, 157, 87, 87);

  /// 期間選択ボタン: 背景色
  static const Color period = darkBlue;

  /// 期間選択ボタン: 背景色 アクティブ時
  static const Color periodActive = Color.fromARGB(255, 35, 35, 106);

  /// 期間選択ボタン: 枠線色
  static const Color periodBorder = blue;

  /// タスク一覧ボタン: 背景色: 濃い
  static const Color taskList = Color.fromARGB(255, 26, 27, 31);

  /// タスク一覧ボタン: 背景色: 薄い
  static const Color taskListThin = Color.fromARGB(255, 43, 47, 56);

  /// タスク一覧ボタン: 枠線色
  static const Color taskListBorder = Color.fromARGB(255, 67, 69, 82);

  /// ラジオボタン: アクティブ
  static const Color radioCircleActive = Color.fromARGB(255, 93, 168, 103);

  /// ラジオボタン: 非アクティブ
  static const Color radioCircleDisable = Color.fromARGB(255, 40, 40, 40);
}
