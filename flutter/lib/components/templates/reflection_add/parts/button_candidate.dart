import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        ElevatedButton,
        Size,
        Align,
        Alignment;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: 候補一覧
class ButtonCandidate extends StatelessWidget {
  const ButtonCandidate({
    super.key,
    required this.color,
    required this.text,
    required this.isThin,
    this.onPressed,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// 薄いか
  final bool isThin;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isThin ? color.button.taskListThin : color.button.taskList,
        fixedSize: const Size.fromHeight(ConstantSizeUI.l7),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: BasicText(
          color: color,
          text: text,
          size: "S",
          isNoSelect: true,
        ),
      ),
    );
  }
}
