import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/templates/rank_detail/widget.dart'
    show TemplateRankDetail;
import 'package:bulby/modules/const/rank/rank_system.dart'
    show constantRankSystems;

/// ページ: ランクの説明
class PageRankDetail extends HookWidget {
  const PageRankDetail({
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
    final ranks = constantRankSystems(i18n);

    return Scaffold(
      body: TemplateRankDetail(
        i18n: i18n,
        color: color,
        ranks: ranks,
      ),
    );
  }
}
