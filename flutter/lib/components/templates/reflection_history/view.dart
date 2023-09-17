import 'package:flutter/material.dart' show Widget, BuildContext, ListView;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/templates/reflection_history/parts/button_history.dart'
    show ButtonHistory;
import 'package:gamer_reflection/components/templates/reflection_history/domain/reflection_history.dart'
    show DomainReflectionHistory;

/// View: 振り返り履歴グループ詳細
Widget view(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  String title,
  List<DomainReflectionHistory> historys,
) {
  ListView cloumn = ListView(
    children: [
      for (int i = 0; i < historys.length; i++) ...{
        ButtonHistory(
          i18n: i18n,
          color: color,
          text: historys[i].text,
          count: historys[i].count,
          isThin: i % 2 == 0,
        )
      }
    ],
  );

  return BaseLayout(
    i18n: i18n,
    color: color,
    title: title,
    isBackGround: false,
    child: cloumn,
  );
}
