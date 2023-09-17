import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/bar.dart' show Bar;
import 'package:bulby/components/templates/solution/parts/button_solution.dart'
    show ButtonSolution;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/templates/solution/domain/reflection.dart'
    show DomainSolutionReflection;

/// 解決案一覧: 一覧
class SolutionList extends StatelessWidget {
  const SolutionList({
    super.key,
    required this.i18n,
    required this.color,
    required this.reflections,
    required this.onPressed,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 振り返り一覧
  final List<DomainSolutionReflection> reflections;

  /// リストアイテムを押した
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < reflections.length; i++) ...{
          Bar(color: color.button.taskListBorder),
          ButtonSolution(
            i18n: i18n,
            color: color,
            text: reflections[i].text,
            isThin: i % 2 == 0,
            count: reflections[i].count,
            tagTextColor: reflections[i].tagColor,
            onPressed: () => onPressed(i),
          ),
        },
        Bar(color: color.button.taskListBorder),
        SpacerHeight.m,
      ],
    );
  }
}
