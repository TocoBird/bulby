import 'package:flutter/material.dart'
    show StatelessWidget, Widget, BuildContext;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/view.dart'
    show view;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/type.dart'
    show Period;

/// 期間を選択するボタンの一覧
class ButtonPeriodFilter extends StatelessWidget {
  const ButtonPeriodFilter({
    super.key,
    required this.i18n,
    required this.color,
    required this.period,
    required this.onPressedLeft,
    required this.onPressedCenter,
    required this.onPressedRight,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 選択しているボタン
  final Period period;

  /// 左をクリックした
  final void Function() onPressedLeft;

  /// 真ん中をクリックした
  final void Function() onPressedCenter;

  /// 右をクリックした
  final void Function() onPressedRight;

  @override
  Widget build(BuildContext context) {
    return view(
      i18n,
      color,
      period,
      onPressedLeft,
      onPressedCenter,
      onPressedRight,
    );
  }
}
