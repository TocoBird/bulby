import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// ボタン
class ButtonDoneMenu extends StatelessWidget {
  const ButtonDoneMenu({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l4),
      elevation: 0,
      fixedSize: const Size.fromHeight(ConstantSizeUI.l4),
      shadowColor: color.button.doneBorder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: color.button.done,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        border: Border.all(
          color: color.button.doneBorder,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: BasicText(
          color: color,
          text: text,
          size: "M",
          isNoSelect: true,
        ),
      ),
    );
  }
}
