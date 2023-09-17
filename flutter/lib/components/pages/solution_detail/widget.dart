import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/solution_detail/widget.dart'
    show TemplateSolutionDetail;
import 'package:gamer_reflection/components/pages/solution_detail/fetch.dart'
    show useFetch;

/// ページ: 解決案詳細
class PageSolutionDetail extends HookWidget {
  const PageSolutionDetail({
    super.key,
    required this.i18n,
    required this.color,
    required this.reflectionId,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 選択している振り返りID
  final int reflectionId;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(reflectionId);

    return Scaffold(
      body: TemplateSolutionDetail(
        i18n: i18n,
        color: color,
        reflectionId: reflectionId,
        reflectionGroupId: d.reflectionGroupId,
        reflection: d.reflection,
        todoCount: d.todoCount,
        updateReflection: d.updateReflection,
        dataFetchState: d.dataFetchState,
        todoExistDB: d.todoExist,
      ),
    );
  }
}
