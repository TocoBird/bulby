import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/reflection_history_group/view.dart'
    show view;
import 'package:gamer_reflection/components/templates/reflection_history_group/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/components/templates/reflection_history_group/domain/reflection_history_group.dart'
    show DomainReflectionHistoryGroup;

/// テンプレート: 振り返り履歴グループ一覧
class TemplateReflectionHistoryGroup extends HookWidget {
  const TemplateReflectionHistoryGroup({
    super.key,
    required this.i18n,
    required this.color,
    required this.title,
    required this.historyGroups,
    required this.pushDetail,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;
  final String title;
  final List<DomainReflectionHistoryGroup> historyGroups;
  final void Function(BuildContext, String, int) pushDetail;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(pushDetail);

    return view(
      i18n,
      color,
      context,
      title,
      historyGroups,
      h.onClickRow,
    );
  }
}
