import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        BoxDecoration,
        Border,
        Expanded,
        Icon,
        Icons,
        IconButton,
        CircleAvatar,
        EdgeInsets,
        Row,
        Container;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/text_tag.dart' show TextTag;
import 'package:bulby/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:bulby/modules/type/tag_text_color.dart' show TagTextColor;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: タスク候補一覧
class ButtonCandidate extends StatelessWidget {
  const ButtonCandidate({
    super.key,
    required this.i18n,
    required this.color,
    required this.text,
    required this.isThin,
    required this.count,
    required this.onClickRemove,
    required this.isSavePage,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// 薄いか
  final bool isThin;

  /// 回数
  final int count;

  /// 削除をクリックした
  final void Function() onClickRemove;

  /// todo: pageを分ける
  final bool isSavePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isThin ? color.button.taskListThin : color.button.taskList,
        border: Border.symmetric(
          vertical: BorderSide(color: color.base.boxBorder),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: ConstantSizeUI.l2,
        horizontal: ConstantSizeUI.l3,
      ),
      child: Row(
        children: [
          TextTag(
            color: color,
            text: i18n.pageReflectionAddedListCountValue(count),
            colorType: TagTextColor.blue,
          ),
          SpacerWidth.m,
          Expanded(
            child: BasicText(
              color: color,
              text: text,
              size: "S",
            ),
          ),
          if (!isSavePage) SpacerWidth.s,
          if (!isSavePage)
            CircleAvatar(
              radius: ConstantSizeUI.l3,
              backgroundColor: color.base.iconBackGround,
              child: IconButton(
                iconSize: ConstantSizeUI.l3,
                padding: const EdgeInsets.all(0),
                icon: Icon(
                  Icons.close,
                  color: color.base.iconDark,
                ),
                onPressed: () => onClickRemove(),
                splashRadius: 0.1,
              ),
            ),
        ],
      ),
    );
  }
}
