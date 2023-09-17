import 'package:flutter/material.dart'
    show StatelessWidget, TextAlign, Widget, BuildContext, Text, TextStyle;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/modules/const/size.dart' show ConstantSizeFont;

/// 注釈テキスト
class TextAnnotation extends StatelessWidget {
  const TextAnnotation({
    super.key,
    required this.color,
    required this.text,
    required this.size,
    this.textAlign,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// サイズ
  final String size;

  /// 寄せる方向
  final TextAlign? textAlign;

  /// 文字サイズを返す
  double getFontSize() {
    switch (size) {
      case "L":
        return ConstantSizeFont.l;
      case "XM":
        return ConstantSizeFont.xm;
      case "M":
        return ConstantSizeFont.m;
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
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontSize: getFontSize(),
        color: color.base.textOpacity,
      ),
    );
  }
}
