import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// 期間を選択するボタン
class ButtonPeriod extends StatelessWidget {
  const ButtonPeriod({
    super.key,
    required this.color,
    required this.text,
    required this.isActive,
    this.onPressed,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// アクティブかどうか
  final bool isActive;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    final style = ElevatedButton.styleFrom(
      backgroundColor:
          isActive ? color.button.periodActive : color.button.period,
      elevation: 4,
      padding: const EdgeInsets.only(
        left: ConstantSizeUI.l0,
        right: ConstantSizeUI.l0,
        top: ConstantSizeUI.l1,
        bottom: ConstantSizeUI.l1,
      ),
      shadowColor: color.button.periodBorder,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: color.button.periodBorder,
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
