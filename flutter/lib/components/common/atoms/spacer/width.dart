import 'package:flutter/material.dart' show SizedBox;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// スペーサー: 横
class SpacerWidth {
  SpacerWidth._();

  /// XS l1
  static const SizedBox xs = SizedBox(width: ConstantSizeUI.l1);

  /// S l2
  static const SizedBox s = SizedBox(width: ConstantSizeUI.l2);

  /// M l3
  static const SizedBox m = SizedBox(width: ConstantSizeUI.l3);

  /// XM l4
  static const SizedBox xm = SizedBox(width: ConstantSizeUI.l4);

  /// L l5
  static const SizedBox l = SizedBox(width: ConstantSizeUI.l5);

  /// XL l6
  static const SizedBox xl = SizedBox(width: ConstantSizeUI.l6);
}
