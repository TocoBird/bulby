import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/reflection_history/domain/reflection_history.dart'
    show DomainReflectionHistory;
import 'package:gamer_reflection/components/templates/reflection_history/view.dart'
    show view;

/// テンプレート: 振り返り履歴グループ詳細
class TemplateReflectionHistory extends HookWidget {
  const TemplateReflectionHistory({
    super.key,
    required this.i18n,
    required this.color,
    required this.historys,
    required this.title,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;
  final List<DomainReflectionHistory> historys;
  final String title;

  @override
  Widget build(BuildContext context) {
    return view(
      i18n,
      color,
      context,
      title,
      historys,
    );
  }
}
