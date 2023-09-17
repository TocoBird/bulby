import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, Padding, EdgeInsets, Column, Expanded;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/layouts/base.dart' show BaseLayout;
import 'package:bulby/components/templates/solution/parts/no_data_annotation.dart'
    show SolutionNoDataAnnotation;
import 'package:bulby/components/templates/solution/parts/solution_list.dart'
    show SolutionList;
import 'package:bulby/components/templates/solution/parts/bottom_buttons.dart'
    show BottomButtons;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/molecules/button_period_filter/widget.dart'
    show ButtonPeriodFilter;
import 'package:bulby/components/common/molecules/button_period_filter/type.dart'
    show Period;
import 'package:bulby/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:bulby/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:bulby/components/templates/solution/domain/reflection.dart'
    show DomainSolutionReflection;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

///
Widget view(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  List<DomainReflectionGroup> reflectionGroups,
  void Function(BuildContext, int) pushSolutionDetail,
  Period period,
  List<DomainSolutionReflection> filteredReflections,
  bool isSelectedGood,
  Future<void> Function() onPressedLeft,
  Future<void> Function() onPressedCenter,
  Future<void> Function() onPressedRight,
  Future<void> Function() onPressedBad,
  Future<void> Function() onPressedGood,
  void Function(String?) onChangeReflectionGroup,
) {
  final list = SolutionList(
    i18n: i18n,
    color: color,
    reflections: filteredReflections,
    onPressed: (int index) => pushSolutionDetail(
      context,
      filteredReflections[index].id,
    ),
  );
  final layoutChild = filteredReflections.isEmpty
      ? SolutionNoDataAnnotation(
          i18n: i18n,
          color: color,
        )
      : list;

  final body = ListView(
    children: [
      SpacerHeight.m,

      /// 振り返りグループ選択ボタン
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantSizeUI.l3,
        ),
        child: SelectReflectionGroup(
          color: color,
          reflectionGroups: reflectionGroups,
          onChanged: onChangeReflectionGroup,
        ),
      ),

      SpacerHeight.m,

      /// 期間選択ボタン
      ButtonPeriodFilter(
        i18n: i18n,
        color: color,
        period: period,
        onPressedLeft: () => onPressedLeft(),
        onPressedCenter: () => onPressedCenter(),
        onPressedRight: () => onPressedRight(),
      ),

      SpacerHeight.m,

      /// 振り返り一覧
      layoutChild,
    ],
  );

  final content = Column(
    children: <Widget>[
      Expanded(child: body),
      BottomButtons(
        i18n: i18n,
        color: color,
        isSelectedGood: isSelectedGood,
        onPressedBad: () => onPressedBad(),
        onPressedGood: () => onPressedGood(),
      ),
    ],
  );

  return BaseLayout(
    i18n: i18n,
    color: color,
    title: i18n.pageSolutionTitle,
    isBackGround: true,
    child: content,
  );
}
