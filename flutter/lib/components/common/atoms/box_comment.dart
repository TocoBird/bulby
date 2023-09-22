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
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// 背景付きコンテンツ: コメント
class BoxComment extends StatelessWidget {
  const BoxComment({
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
      color: color.base.boxComment,
      border: Border.all(color: color.base.boxCommentBorder),
      borderRadius: BorderRadius.circular(ConstantSizeUI.l2),
    );

    return Container(
      padding: const EdgeInsets.all(ConstantSizeUI.l3),
      width: double.infinity,
      decoration: decoration,
      child: child,
    );
  }
}
