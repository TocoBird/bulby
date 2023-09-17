import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: 履歴グループ一覧
class ButtonHistoryGroup extends StatelessWidget {
  const ButtonHistoryGroup({
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
        minimumSize: const Size.fromHeight(ConstantSizeUI.l10),
        padding: const EdgeInsets.only(
          left: ConstantSizeUI.l3,
          right: 0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: BasicText(
              color: color,
              text: text,
              size: "M",
              isNoSelect: true,
            ),
          ),
          SpacerWidth.s,
          Icon(
            Icons.arrow_right,
            color: color.base.taskListArrow,
            size: 40.0,
          ),
        ],
      ),
    );
  }
}
