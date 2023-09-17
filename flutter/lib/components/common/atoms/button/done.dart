import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: 完了
class ButtonDone extends StatelessWidget {
  const ButtonDone({
    super.key,
    required this.color,
    required this.text,
    this.isActive,
    this.onPressed,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// アクティブかどうか
  final bool? isActive;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    /// アクティブ状態か
    bool isActiveMode() {
      if (isActive == null) return true;
      return isActive!;
    }

    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    final style = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      disabledBackgroundColor: color.button.doneDisable,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 0,
      shadowColor: isActiveMode()
          ? color.button.doneBorder
          : color.button.doneBorderDisable,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: color.button.done,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        border: Border.all(
          color: isActiveMode()
              ? color.button.doneBorder
              : color.button.doneBorderDisable,
        ),
      ),
      child: ElevatedButton.icon(
        onPressed: isActiveMode() ? onPressed : null,
        style: style,
        icon: Icon(
          Icons.check_circle,
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
