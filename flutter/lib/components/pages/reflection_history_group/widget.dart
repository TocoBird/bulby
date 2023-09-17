import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/templates/reflection_history_group/widget.dart'
    show TemplateReflectionHistoryGroup;
import 'package:bulby/components/pages/reflection_history_group/fetch.dart'
    show useFetch;

/// ページ: 振り返り履歴グループ一覧
class PageReflectionHistoryGroup extends HookWidget {
  const PageReflectionHistoryGroup({
    super.key,
    required this.i18n,
    required this.color,
    required this.title,
    required this.groupId,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 振り返りグループ名
  final String title;

  /// 振り返りグループID
  final int groupId;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(groupId, i18n, color);

    return Scaffold(
      body: TemplateReflectionHistoryGroup(
        i18n: i18n,
        color: color,
        historyGroups: d.historyGroups,
        pushDetail: d.pushDetail,
        title: title,
      ),
    );
  }
}
