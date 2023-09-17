import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Color,
        Widget,
        BuildContext,
        ConstrainedBox,
        BoxConstraints,
        Container,
        BoxDecoration,
        BorderRadius,
        Border,
        BoxShadow,
        EdgeInsets,
        Text,
        TextAlign,
        TextStyle;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/modules/const/size.dart' show ConstantSizeFont;
import 'package:bulby/modules/type/tag_text_color.dart' show TagTextColor;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// タグテキスト
class TextTag extends StatelessWidget {
  const TextTag({
    super.key,
    required this.color,
    required this.text,
    required this.colorType,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// 色の種類
  final TagTextColor colorType;

  /// タグの枠線色を取得
  Color getBorderColor() {
    switch (colorType) {
      case TagTextColor.red:
        return color.textTag.redBorder;
      case TagTextColor.purple:
        return color.textTag.purpleBorder;
      case TagTextColor.blue:
        return color.textTag.blueBorder;
      case TagTextColor.gray:
        return color.textTag.grayBorder;
      default:
        return color.textTag.blueBorder;
    }
  }

  /// タグのテキスト色を取得
  Color getTextColor() {
    switch (colorType) {
      case TagTextColor.red:
        return color.textTag.redText;
      case TagTextColor.purple:
        return color.textTag.purpleText;
      case TagTextColor.blue:
        return color.textTag.blueText;
      case TagTextColor.gray:
        return color.textTag.grayText;
      default:
        return color.textTag.blueText;
    }
  }

  /// タグのテキスト色を取得
  Color getBackGroundColor() {
    switch (colorType) {
      case TagTextColor.gray:
        return color.textTag.grayBackGround;
      default:
        return color.textTag.background;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: ConstantSizeUI.l7,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: getBackGroundColor(),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: getBorderColor()),
          boxShadow: [
            BoxShadow(
              color: getBorderColor(),
              spreadRadius: 0,
              blurRadius: ConstantSizeUI.l0,
            ),
          ],
        ),
        padding: const EdgeInsets.only(
          top: ConstantSizeUI.l0,
          bottom: ConstantSizeUI.l0,
          left: ConstantSizeUI.l2,
          right: ConstantSizeUI.l2,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ConstantSizeFont.xs,
            color: getTextColor(),
          ),
        ),
      ),
    );
  }
}
