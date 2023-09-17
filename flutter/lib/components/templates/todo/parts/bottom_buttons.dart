import 'package:flutter/material.dart'
    show Widget, BuildContext, Padding, EdgeInsets, Row, Expanded, Container;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:bulby/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:bulby/components/common/atoms/button/thin.dart' show ButtonThin;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// 下部の固定ボタン
class TodoBottomButtons extends HookWidget {
  const TodoBottomButtons({
    super.key,
    required this.i18n,
    required this.color,
    required this.isSelectedTraining,
    required this.onPressedGame,
    required this.onPressedTraining,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 練習を選択
  final bool isSelectedTraining;

  /// 試合を押した
  final void Function() onPressedGame;

  /// 練習を押した
  final void Function() onPressedTraining;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.base.content,
      child: Padding(
        padding: const EdgeInsets.only(
          top: ConstantSizeUI.l1,
          bottom: ConstantSizeUI.l1,
        ),
        child: Row(
          children: [
            SpacerWidth.m,
            Expanded(
              child: ButtonThin(
                color: color,
                text: i18n.pageTodoButtonGame,
                onPressed: () => onPressedGame(),
                isActive: !isSelectedTraining,
              ),
            ),
            SpacerWidth.m,
            Expanded(
              child: ButtonThin(
                color: color,
                text: i18n.pageTodoButtonTraining,
                onPressed: () => onPressedTraining(),
                isActive: isSelectedTraining,
              ),
            ),
            SpacerWidth.m,
          ],
        ),
      ),
    );
  }
}
