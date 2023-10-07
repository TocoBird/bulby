import 'package:flutter/material.dart' show Color;

class ColorInput {
  const ColorInput({
    required this.input,
    required this.inputBorder,
    required this.inputHintText,
    required this.inputBorderFocus,
    required this.inputBorderError,
    required this.inputErrorText,
  });

  /// inputの背景色
  final Color input;

  /// inputの枠線色
  final Color inputBorder;

  /// prefixの文字色
  final Color inputHintText;

  /// inputの枠線色フォーカス
  final Color inputBorderFocus;

  /// inputの枠線色エラーテキスト
  final Color inputBorderError;

  /// inputのエラーテキスト色
  final Color inputErrorText;
}

ColorInput colorInput(bool isDark) {
  input() {
    if (isDark) return ConstantColorInputDark.input;
    return ConstantColorInputLight.input;
  }

  inputBorder() {
    if (isDark) return ConstantColorInputDark.inputBorder;
    return ConstantColorInputLight.inputBorder;
  }

  inputHintText() {
    if (isDark) return ConstantColorInputDark.inputHintText;
    return ConstantColorInputLight.inputHintText;
  }

  inputBorderFocus() {
    if (isDark) return ConstantColorInputDark.inputBorderFocus;
    return ConstantColorInputLight.inputBorderFocus;
  }

  inputBorderError() {
    if (isDark) return ConstantColorInputDark.inputBorderError;
    return ConstantColorInputLight.inputBorderError;
  }

  inputErrorText() {
    if (isDark) return ConstantColorInputDark.inputErrorText;
    return ConstantColorInputLight.inputErrorText;
  }

  return ColorInput(
    input: input(),
    inputBorder: inputBorder(),
    inputHintText: inputHintText(),
    inputBorderFocus: inputBorderFocus(),
    inputBorderError: inputBorderError(),
    inputErrorText: inputErrorText(),
  );
}

/// 用途ごとに色を定義する: input: ダークモード
class ConstantColorInputDark {
  ConstantColorInputDark._();

  /// inputの背景色
  static const Color input = Color.fromARGB(255, 24, 25, 31);

  /// inputの枠線色
  static const Color inputBorder = Color.fromARGB(255, 38, 43, 123);

  /// prefixの文字色
  static const Color inputHintText = Color.fromARGB(70, 255, 255, 255);

  /// inputの枠線色フォーカス
  static const Color inputBorderFocus = Color.fromARGB(255, 38, 43, 123);

  /// inputの枠線色エラーテキスト
  static const Color inputBorderError = Color.fromARGB(255, 118, 63, 63);

  /// inputのエラーテキスト色
  static const Color inputErrorText = Color.fromARGB(255, 255, 223, 223);
}

/// 用途ごとに色を定義する: input: ダークモード
class ConstantColorInputLight {
  ConstantColorInputLight._();

  /// inputの背景色
  static const Color input = Color.fromARGB(255, 24, 25, 31);

  /// inputの枠線色
  static const Color inputBorder = Color.fromARGB(255, 38, 43, 123);

  /// prefixの文字色
  static const Color inputHintText = Color.fromARGB(70, 255, 255, 255);

  /// inputの枠線色フォーカス
  static const Color inputBorderFocus = Color.fromARGB(255, 38, 43, 123);

  /// inputの枠線色エラーテキスト
  static const Color inputBorderError = Color.fromARGB(255, 118, 63, 63);

  /// inputのエラーテキスト色
  static const Color inputErrorText = Color.fromARGB(255, 255, 223, 223);
}
