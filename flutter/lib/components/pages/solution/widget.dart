import 'package:flutter/material.dart'
    show Widget, BuildContext, Scaffold, ValueNotifier;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/solution/widget.dart'
    show TemplateSolution;
import 'package:gamer_reflection/components/pages/solution/fetch.dart'
    show useFetch;

/// ページ: 解決案一覧
class PageSolution extends HookWidget {
  const PageSolution({
    super.key,
    required this.i18n,
    required this.color,
    required this.canDC,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  ///
  final ValueNotifier<bool> canDC;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(canDC, i18n, color);

    return Scaffold(
      body: TemplateSolution(
        i18n: i18n,
        color: color,
        reflections: d.reflections,
        reflectionGroups: d.reflectionGroups,
        pushSolutionDetail: d.pushSolutionDetail,
        fetchReflections: d.fetchReflections,
      ),
    );
  }
}
