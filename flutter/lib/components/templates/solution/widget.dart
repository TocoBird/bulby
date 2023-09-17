import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/solution/domain/reflection.dart'
    show DomainSolutionReflection;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/templates/solution/view.dart'
    show view;
import 'package:gamer_reflection/components/templates/solution/hooks.dart'
    show useHooks;

/// テンプレート: 解決案一覧
class TemplateSolution extends HookWidget {
  const TemplateSolution({
    super.key,
    required this.i18n,
    required this.color,
    required this.reflections,
    required this.reflectionGroups,
    required this.pushSolutionDetail,
    required this.fetchReflections,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 振り返り一覧
  final List<DomainSolutionReflection> reflections;

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  /// クリックした
  final void Function(BuildContext, int) pushSolutionDetail;

  /// 振り返りの取得をする
  final Future<void> Function() fetchReflections;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(reflections, reflectionGroups, fetchReflections);

    return view(
      i18n,
      color,
      context,
      reflectionGroups,
      pushSolutionDetail,
      h.period,
      h.filteredReflections,
      h.isSelectedGood,
      h.onPressedLeft,
      h.onPressedCenter,
      h.onPressedRight,
      h.onPressedBad,
      h.onPressedGood,
      h.onChangeReflectionGroup,
    );
  }
}
