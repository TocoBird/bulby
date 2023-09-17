import 'package:flutter/material.dart' show BuildContext;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:bulby/components/templates/reflection/domain/game.dart'
    show DomainReflectionGame;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;
import 'package:bulby/components/common/atoms/toast/hooks.dart' show useToast;

class UseReturn {
  const UseReturn({
    required this.onPressedStart,
    required this.onPressedHistory,
    required this.onPressedRankDetail,
    required this.expText,
    required this.gaugePercent,
    required this.onChangeReflectionGroup,
  });
  final double gaugePercent;
  final Future<void> Function(BuildContext) onPressedStart;
  final Future<void> Function(BuildContext) onPressedHistory;
  final void Function(BuildContext) onPressedRankDetail;
  final String Function() expText;
  final void Function(String?) onChangeReflectionGroup;
}

/// ロジック: 振り返りページ
UseReturn useHooks(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  List<DomainReflectionGroup> reflectionGroups,
  DomainReflectionGame game,
  int reflectionCount,
  void Function(BuildContext, String, int) pushReflection,
  void Function(BuildContext, String, int) pushHistory,
  void Function(BuildContext) pushRankDetail,
  Future<void> Function() fetchCounts,
) {
  // トースト通知
  final toast = useToast(context, color);

  /// 振り返りの開始を押した
  Future<void> onPressedStart(BuildContext c) async {
    // グループIDがなければ実行不可
    final cacheGroupId = await selectReflectionGroupId.get();
    if (cacheGroupId == null) return;

    // そのグループの振り返り上限数を超えていたら追加できない
    const max = 350;
    if (reflectionCount >= max) {
      final current = reflectionCount;
      final numStr = "($current / $max)";
      toast.showAlert(i18n.pageReflectionHooksAddValidation(numStr), 4000);
      return;
    }

    // グループIDを取得する
    final int groupId = int.parse(cacheGroupId.toString());
    final DomainReflectionGroup d = reflectionGroups.firstWhere(
      (r) => r.id == groupId,
      orElse: () => const DomainReflectionGroup(id: 0, name: ""),
    );

    // 追加ページを開く
    if (c.mounted) pushReflection(c, d.name, groupId);
  }

  /// 振り返り履歴を押した
  Future<void> onPressedHistory(BuildContext c) async {
    final cacheGroupId = await selectReflectionGroupId.get();
    if (cacheGroupId == null) return;

    final int groupId = int.parse(cacheGroupId.toString());
    final DomainReflectionGroup d = reflectionGroups.firstWhere(
      (r) => r.id == groupId,
      orElse: () => const DomainReflectionGroup(id: 0, name: ""),
    );

    // 履歴ページを開く
    if (c.mounted) pushHistory(c, d.name, groupId);
  }

  /// ランク説明を押した
  void onPressedRankDetail(BuildContext c) {
    pushRankDetail(c);
  }

  /// 経験値と次の経験値の文言を返す
  String expText() {
    if (game.nextExp == null) return '${game.exp}';
    return '${game.exp} / ${game.nextExp}';
  }

  /// ゲージ
  double getGaugePercent() {
    if (game.nextExp == null) return 1;
    final current = game.exp - game.prevExp;
    final max = game.nextExp! - game.prevExp;
    if (max == 0) return 0;

    final v = current / max;
    return double.parse((v).toStringAsFixed(3));
  }

  /// 振り返りグループが変更された
  void onChangeReflectionGroup(String? id) {
    fetchCounts();
  }

  return UseReturn(
    gaugePercent: getGaugePercent(),
    onPressedStart: onPressedStart,
    onPressedHistory: onPressedHistory,
    onPressedRankDetail: onPressedRankDetail,
    expText: expText,
    onChangeReflectionGroup: onChangeReflectionGroup,
  );
}
