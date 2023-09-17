import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/reflection/widget.dart'
    show TemplateReflection;
import 'package:gamer_reflection/components/pages/reflection/fetch.dart'
    show useFetch;

/// ページ: 振り返りの追加説明
class PageReflection extends HookWidget {
  const PageReflection({
    super.key,
    required this.i18n,
    required this.color,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(i18n, color);

    return Scaffold(
      body: TemplateReflection(
        i18n: i18n,
        color: color,
        reflectionGroups: d.reflectionGroups,
        game: d.game,
        reflectionCount: d.reflectionCount,
        pushReflection: d.pushReflection,
        pushHistory: d.pushHistory,
        pushRankDetail: d.pushRankDetail,
        fetchCounts: d.fetchCounts,
      ),
    );
  }
}
