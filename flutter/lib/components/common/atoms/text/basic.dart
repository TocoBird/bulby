import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        TextAlign,
        BuildContext,
        Text,
        SelectableText,
        TextStyle,
        FontWeight;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/modules/const/size.dart' show ConstantSizeFont;

/// 基本的なテキスト
class BasicText extends StatelessWidget {
  const BasicText({
    super.key,
    required this.color,
    required this.text,
    required this.size,
    this.textAlign,
    this.isNoSelect,
    this.isBold,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// サイズ
  final String size;

  /// 太字
  final bool? isBold;

  /// 選択可能か
  final bool? isNoSelect;

  /// 寄せる方向
  final TextAlign? textAlign;

  /// 文字サイズを返す
  double getFontSize() {
    switch (size) {
      case "L":
        return ConstantSizeFont.l;
      case "M":
        return ConstantSizeFont.m;
      case "XM":
        return ConstantSizeFont.xm;
      case "S":
        return ConstantSizeFont.s;
      case "XS":
        return ConstantSizeFont.xs;
      default:
        return ConstantSizeFont.s;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isBoldFont = isBold != null && isBold!;

    /// 選択不能なテキスト
    if (isNoSelect != null && isNoSelect!) {
      return Text(
        text,
        textAlign: textAlign ?? TextAlign.left,
        style: TextStyle(
          fontSize: getFontSize(),
          fontWeight: isBoldFont ? FontWeight.bold : FontWeight.normal,
          color: isBoldFont ? color.base.textBold : color.base.text,
        ),
      );
    }

    return SelectableText(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontSize: getFontSize(),
        fontWeight: isBoldFont ? FontWeight.bold : FontWeight.normal,
        color: isBoldFont ? color.base.textBold : color.base.text,
      ),
    );
  }
}
