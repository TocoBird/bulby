import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        ElevatedButton,
        Size,
        EdgeInsets,
        Row,
        Expanded,
        Icon,
        Icons;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;
import 'package:bulby/components/common/atoms/text_tag.dart' show TextTag;
import 'package:bulby/modules/type/tag_text_color.dart' show TagTextColor;

/// ボタン: 詳細アイテム
class ButtonSolution extends StatelessWidget {
  const ButtonSolution({
    super.key,
    required this.i18n,
    required this.color,
    required this.text,
    required this.isThin,
    required this.count,
    required this.tagTextColor,
    this.onPressed,
  });

  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// 薄いか
  final bool isThin;

  /// 回数
  final int count;

  /// 色
  final TagTextColor tagTextColor;

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
          TextTag(
            color: color,
            text: i18n.pageSolutionCountValue(count),
            colorType: tagTextColor,
          ),
          SpacerWidth.m,
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
