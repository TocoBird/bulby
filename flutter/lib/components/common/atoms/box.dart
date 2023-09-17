import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        BoxDecoration,
        Border,
        Container,
        BorderRadius,
        EdgeInsets;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// 背景付きコンテンツ
class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.color,
    required this.child,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: color.base.box,
      border: Border.all(color: color.base.boxBorder),
      borderRadius: BorderRadius.circular(ConstantSizeUI.l1),
    );

    return Container(
      padding: const EdgeInsets.all(ConstantSizeUI.l3),
      width: double.infinity,
      decoration: decoration,
      child: child,
    );
  }
}
