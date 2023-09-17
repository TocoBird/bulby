import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, TextAlign;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:intl/intl.dart' show DateFormat;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/templates/reflection_history_group/domain/reflection_history_group.dart'
    show DomainReflectionHistoryGroup;
import 'package:gamer_reflection/components/templates/reflection_history_group/parts/button_history_group.dart'
    show ButtonHistoryGroup;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;

/// View: 振り返り履歴グループ一覧
Widget view(
  AppLocalizations i18n,
  UseColor color,
  BuildContext c,
  String title,
  final List<DomainReflectionHistoryGroup> historyGroups,
  final void Function(BuildContext, String, int) onClickRow,
) {
  ListView cloumn = ListView(
    children: [
      if (historyGroups.isEmpty) ...{
        SpacerHeight.m,
        TextAnnotation(
          color: color,
          text: i18n.pageReflectionHistoryGroupNoList,
          size: "M",
          textAlign: TextAlign.center,
        ),
      },
      for (int i = 0; i < historyGroups.length; i++) ...{
        ButtonHistoryGroup(
          color: color,
          text: DateFormat('yyyy.MM.dd HH:mm').format(historyGroups[i].date),
          isThin: i % 2 == 0,
          onPressed: () => onClickRow(
            c,
            DateFormat('yyyy.MM.dd HH:mm').format(historyGroups[i].date),
            historyGroups[i].id,
          ),
        )
      },
      if (historyGroups.isNotEmpty) ...{
        SpacerHeight.m,
        TextAnnotation(
          color: color,
          text: i18n.pageReflectionHistoryGroupAnnotation,
          size: "S",
          textAlign: TextAlign.center,
        ),
      }
    ],
  );

  return BaseLayout(
    i18n: i18n,
    color: color,
    title: i18n.pageReflectionHistoryGroupTitle(title),
    isBackGround: false,
    child: cloumn,
  );
}
