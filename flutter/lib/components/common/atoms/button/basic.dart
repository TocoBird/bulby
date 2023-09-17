import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// ボタン
class ButtonBasic extends StatelessWidget {
  const ButtonBasic({
    super.key,
    required this.color,
    required this.text,
    this.onPressed,
    this.textSize,
    this.isThin,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// 薄いか
  final bool? isThin;

  /// 文字サイズ
  final String? textSize;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isThinColor = isThin ?? false;

    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    final style = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      shadowColor:
          isThinColor ? color.button.basicBorderThin : color.button.basicBorder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      elevation: 0,
    );

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isThinColor ? color.button.basicThin : color.button.basic,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        border: Border.all(
          color: isThinColor
              ? color.button.basicBorderThin
              : color.button.basicBorder,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: BasicText(
          color: color,
          text: text,
          size: textSize ?? "M",
          isNoSelect: true,
        ),
      ),
    );
  }
}
