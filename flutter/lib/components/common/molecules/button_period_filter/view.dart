import 'package:flutter/material.dart' show Widget, Expanded, Row;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/button/period.dart'
    show ButtonPeriod;
import 'package:bulby/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:bulby/components/common/molecules/button_period_filter/type.dart'
    show Period;

///
Widget view(
  AppLocalizations i18n,
  UseColor color,
  Period period,
  void Function() onPressedLeft,
  void Function() onPressedCenter,
  void Function() onPressedRight,
) {
  return Row(
    children: [
      SpacerWidth.m,
      Expanded(
        child: ButtonPeriod(
          color: color,
          text: i18n.commonButtonPeriodFilterAll,
          isActive: period == Period.leftButton,
          onPressed: onPressedLeft,
        ),
      ),
      SpacerWidth.s,
      Expanded(
        child: ButtonPeriod(
          color: color,
          text: i18n.commonButtonPeriodFilterCenter,
          isActive: period == Period.centerButton,
          onPressed: onPressedCenter,
        ),
      ),
      SpacerWidth.s,
      Expanded(
        child: ButtonPeriod(
          color: color,
          text: i18n.commonButtonPeriodFilterRight,
          isActive: period == Period.rightButton,
          onPressed: onPressedRight,
        ),
      ),
      SpacerWidth.m,
    ],
  );
}
