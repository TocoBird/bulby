import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// 薄いボタン
class ButtonThin extends StatelessWidget {
  const ButtonThin({
    super.key,
    required this.color,
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// クリックした
  final void Function() onPressed;

  /// アクティブか
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    /// クリックされた
    void onPressed() {
      this.onPressed();
    }

    final style = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: isActive ? color.button.thinActive : color.button.thin,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l6),
      elevation: 2,
      shadowColor:
          isActive ? color.button.thinActiveBorder : color.button.thinBorder,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: isActive
              ? color.button.thinActiveBorder
              : color.button.thinBorder,
        ),
      ),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: BasicText(
        color: color,
        text: text,
        size: "M",
        isNoSelect: true,
      ),
    );
  }
}
