import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: アイコン付き
class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// アイコン
  final IconData icon;

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
      backgroundColor: Colors.transparent,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 2,
      shadowColor: color.button.basicBorder,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 1.0,
          color: color.button.basicBorder,
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: color.button.basic,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: style,
        icon: Icon(
          icon,
          color: color.base.icon,
        ),
        label: BasicText(
          color: color,
          text: text,
          size: "M",
          isNoSelect: true,
        ),
      ),
    );
  }
}
