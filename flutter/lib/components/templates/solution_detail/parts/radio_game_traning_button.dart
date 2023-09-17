import 'package:flutter/material.dart' show Widget, BuildContext, Column;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/button/radio.dart'
    show ButtonRadio;

/// ラジオボタン: 試合か練習か
class RadioGameTraningButton extends HookWidget {
  const RadioGameTraningButton({
    super.key,
    required this.i18n,
    required this.color,
    required this.groupValue,
    required this.onChangedGame,
    required this.onChangedTraning,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String groupValue;

  /// 良いに変更した
  final void Function(String?) onChangedGame;

  /// 悪いに変更した
  final void Function(String?) onChangedTraning;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonRadio(
          color: color,
          groupValue: groupValue,
          value: "game",
          text: i18n.solutionDetailPageModalAddTodoGame,
          onPressed: (v) => onChangedGame(v),
        ),
        SpacerHeight.m,
        ButtonRadio(
          color: color,
          groupValue: groupValue,
          value: "traning",
          text: i18n.solutionDetailPageModalAddTodoTraning,
          onPressed: (v) => onChangedTraning(v),
        ),
      ],
    );
  }
}
