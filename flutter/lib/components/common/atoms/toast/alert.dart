import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        Container,
        EdgeInsets,
        BoxDecoration,
        BorderRadius;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// トースト: 注意
class ToastAlert extends StatelessWidget {
  const ToastAlert({
    super.key,
    required this.color,
    required this.text,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ConstantSizeUI.l3,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ConstantSizeUI.l3),
        color: color.base.alert,
      ),
      child: BasicText(
        color: color,
        text: text,
        size: "M",
      ),
    );
  }
}
