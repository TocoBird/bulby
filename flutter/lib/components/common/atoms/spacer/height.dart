import 'package:flutter/material.dart' show SizedBox;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// スペーサー: 縦
class SpacerHeight {
  SpacerHeight._();

  /// XS l1
  static const SizedBox xs = SizedBox(height: ConstantSizeUI.l1);

  /// S l2
  static const SizedBox s = SizedBox(height: ConstantSizeUI.l2);

  /// M l3
  static const SizedBox m = SizedBox(height: ConstantSizeUI.l3);

  /// XM l4
  static const SizedBox xm = SizedBox(height: ConstantSizeUI.l4);

  /// L l5
  static const SizedBox l = SizedBox(height: ConstantSizeUI.l5);

  /// XL l6
  static const SizedBox xl = SizedBox(height: ConstantSizeUI.l6);
}
