import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;
import 'package:bulby/components/common/atoms/spacer/width.dart'
    show SpacerWidth;

/// ボタン: ラジオ
class ButtonRadio extends StatelessWidget {
  const ButtonRadio({
    super.key,
    required this.color,
    this.minimumSize,
    required this.text,
    required this.groupValue,
    required this.value,
    required this.onPressed,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// 選択してるグループId
  final String groupValue;

  /// グループId
  final String value;

  /// グループId
  final double? minimumSize;

  /// クリックした
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    /// クリックされた
    void onPressed() {
      this.onPressed(value);
    }

    final bool isActive = value == groupValue;
    final Color circleColor = isActive
        ? color.button.radioCircleActive
        : color.button.radioCircleDisable;

    final style = ElevatedButton.styleFrom(
      backgroundColor: color.button.radio,
      minimumSize: Size.fromHeight(
        minimumSize ?? ConstantSizeUI.l7,
      ),
      padding: const EdgeInsets.only(left: ConstantSizeUI.l2),
      elevation: 2,
      shadowColor:
          isActive ? color.button.radioBorderActive : color.button.radioBorder,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: isActive
              ? color.button.radioBorderActive
              : color.button.radioBorder,
        ),
      ),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Row(
        children: [
          Icon(
            Icons.adjust,
            color: circleColor,
            size: ConstantSizeUI.l4,
          ),
          SpacerWidth.xs,
          BasicText(
            color: color,
            text: text,
            size: "M",
            isNoSelect: true,
          ),
        ],
      ),
    );
  }
}
