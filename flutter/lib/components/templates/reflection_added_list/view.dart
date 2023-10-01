import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, Column, Expanded, Padding, EdgeInsets;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/layouts/base.dart' show BaseLayout;
import 'package:bulby/components/templates/reflection_add/domain/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/bar.dart' show Bar;
import 'package:bulby/components/templates/reflection_added_list/parts/button_candidate.dart'
    show ButtonCandidate;
import 'package:bulby/components/common/atoms/button/done.dart' show ButtonDone;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

///
Widget view(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  List<DomainReflectionAdded> reflections,
  Future<bool> Function(BuildContext) onWillPop,
  void Function(String) onClickRemove,
  void Function(BuildContext) onPressedReflectionDone,
) {
  ListView column = ListView(
    children: [
      Column(
        children: [
          for (int i = 0; i < reflections.length; i++) ...{
            Bar(
              color: color.button.taskListBorder,
            ),
            ButtonCandidate(
              i18n: i18n,
              color: color,
              text: reflections[i].text,
              isThin: i % 2 == 0,
              count: reflections[i].count,
              onClickRemove: () => onClickRemove(reflections[i].text),
            ),
          },
          Bar(
            color: color.button.taskListBorder,
          )
        ],
      ),
      SpacerHeight.xl,
    ],
  );

  final content = Column(
    children: <Widget>[
      Expanded(child: column),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantSizeUI.l3,
          vertical: ConstantSizeUI.l3,
        ),
        child: ButtonDone(
          color: color,
          text: i18n.pageReflectionAddedListButtonSave,
          onPressed: () => onPressedReflectionDone(context),
        ),
      ),
    ],
  );

  return BaseLayout(
    i18n: i18n,
    color: color,
    title: i18n.pageReflectionAddedListTitle,
    isBackGround: false,
    child: content,
    onWillPop: () => onWillPop(context),
  );
}
