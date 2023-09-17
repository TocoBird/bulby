import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/templates/rank_detail/view.dart' show view;
import 'package:bulby/modules/const/rank/rank_system.dart'
    show ConstantRankSystem;

/// テンプレート: ランクの説明
class TemplateRankDetail extends HookWidget {
  const TemplateRankDetail({
    super.key,
    required this.i18n,
    required this.color,
    required this.ranks,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// ランク一覧
  final List<ConstantRankSystem> ranks;

  @override
  Widget build(BuildContext context) {
    return view(
      i18n,
      color,
      ranks,
    );
  }
}
