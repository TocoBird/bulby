import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/reflection_history/widget.dart'
    show TemplateReflectionHistory;
import 'package:gamer_reflection/components/pages/reflection_history/fetch.dart'
    show useFetch;

/// ページ: 振り返り履歴グループ詳細
class PageReflectionHistory extends HookWidget {
  const PageReflectionHistory({
    super.key,
    required this.i18n,
    required this.color,
    required this.historyGroupId,
    required this.title,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 振り返り履歴グループID
  final int historyGroupId;

  /// 振り返り履歴グループ名
  final String title;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(historyGroupId);

    return Scaffold(
      body: TemplateReflectionHistory(
        i18n: i18n,
        color: color,
        historys: d.historys,
        title: title,
      ),
    );
  }
}
