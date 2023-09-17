import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/templates/reflection/domain/game.dart'
    show DomainReflectionGame;
import 'package:gamer_reflection/components/templates/reflection/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/components/templates/reflection/view.dart'
    show view;

/// テンプレート: 振り返り
class TemplateReflection extends HookWidget {
  const TemplateReflection({
    super.key,
    required this.i18n,
    required this.color,
    required this.reflectionGroups,
    required this.reflectionCount,
    required this.game,
    required this.pushReflection,
    required this.pushHistory,
    required this.pushRankDetail,
    required this.fetchCounts,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  /// ゲーミフィケーション
  final DomainReflectionGame game;

  /// 振り返り総数
  final int reflectionCount;

  /// 振り返り追加ページへ飛ぶ
  final void Function(BuildContext, String, int) pushReflection;

  /// 振り返り履歴ページへ飛ぶ
  final void Function(BuildContext, String, int) pushHistory;

  /// ランク説明ページへ移動
  final void Function(BuildContext) pushRankDetail;

  /// 振り返り総数の取得をする
  final Future<void> Function() fetchCounts;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(
      i18n,
      color,
      context,
      reflectionGroups,
      game,
      reflectionCount,
      pushReflection,
      pushHistory,
      pushRankDetail,
      fetchCounts,
    );

    return view(
      i18n,
      color,
      context,
      reflectionGroups,
      h.expText(),
      game.rank,
      game.rankImage,
      h.gaugePercent,
      h.onPressedStart,
      h.onPressedHistory,
      h.onPressedRankDetail,
      h.onChangeReflectionGroup,
    );
  }
}
