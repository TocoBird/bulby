import 'dart:convert' show utf8;
import 'package:flutter/material.dart';

/// 先頭が空白
bool fisrtSpace(String v) {
  return RegExp(r'^\s+').hasMatch(v);
}

/// 末尾が空白
bool lastSpace(String v) {
  return RegExp(r'\s+$').hasMatch(v);
}

/// 空白しか入っていない
bool allSpace(String v) {
  final String noSpaceStr = v.replaceAll(RegExp(r'\s+'), '');
  return noSpaceStr.isEmpty;
}

/// マルチバイトを加味して、文字の合計サイズを取得する
/// 日本語などの3byteは2, ロシア語などの2byteは1, その他は1として加算する
int getMultibyteSize(String v) {
  int sizeSum = 0;
  for (var c in v.characters) {
    // 3byteは2個
    if (utf8.encode(c).length >= 3) {
      sizeSum += 2;
    } else {
      // 1と2byteは1個
      sizeSum++;
    }
  }
  return sizeSum;
}

/// 文字数が超えたマルチバイト
bool maxLengthOverForMultibyte(String v, int? maxLength) {
  if (maxLength == null) return false;
  final int sizeSum = getMultibyteSize(v);
  return sizeSum > maxLength;
}
