import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Navigator, MaterialPageRoute;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:bulby/components/pages/reflection_add/widget.dart'
    show PageReflectionAdd;
import 'package:bulby/components/pages/reflection_history_group/widget.dart'
    show PageReflectionHistoryGroup;
import 'package:bulby/components/pages/rank_detail/widget.dart'
    show PageRankDetail;
import 'package:bulby/components/templates/reflection/domain/game.dart'
    show DomainReflectionGame;
import 'package:bulby/api/query/controller/reflection.dart'
    show FetchReflectionPage;
import 'package:bulby/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;

class UseReturn {
  const UseReturn({
    required this.reflectionGroups,
    required this.fetchCounts,
    required this.game,
    required this.reflectionCount,
    required this.pushReflection,
    required this.pushHistory,
    required this.pushRankDetail,
  });

  final List<DomainReflectionGroup> reflectionGroups;
  final Future<void> Function() fetchCounts;
  final DomainReflectionGame game;
  final int reflectionCount;
  final void Function(BuildContext, String, int) pushReflection;
  final void Function(BuildContext, String, int) pushHistory;
  final void Function(BuildContext) pushRankDetail;
}

/// データ取得: 振り返りグループ一覧
UseReturn useFetch(AppLocalizations i18n, UseColor color) {
  final ValueNotifier<List<DomainReflectionGroup>> reflectionGroups =
      useState<List<DomainReflectionGroup>>([]);
  final ValueNotifier<DomainReflectionGame> game =
      useState<DomainReflectionGame>(
    const DomainReflectionGame(
      exp: 0,
      nextExp: 0,
      prevExp: 0,
      rank: '',
      rankImage: '',
    ),
  );
  // 振り返り総数
  final ValueNotifier<int> reflectionCount = useState<int>(0);

  /// 振り返りグループIDの取得
  int getReflectionGroupId(String? id) {
    if (id != null) return int.parse(id);
    return reflectionGroups.value.isEmpty ? 1 : reflectionGroups.value[0].id;
  }

  /// データ取得
  Future<void> fetch() async {
    final List<DomainReflectionGroup> r =
        await FetchReflectionPage().fetchReflectionGroups();
    reflectionGroups.value = r;

    final DomainReflectionGame g = await FetchReflectionPage().fetchGame(i18n);
    game.value = g;

    // 振り返りの総数を取得
    final String? id = await selectReflectionGroupId.get();
    final int groupId = getReflectionGroupId(id);
    final int count = await FetchReflectionPage().fetchReflectionCount(groupId);
    reflectionCount.value = count;
  }

  /// 振り返り追加ページへ移動
  void pushReflection(BuildContext context, String name, int groupId) {
    final PageReflectionAdd page = PageReflectionAdd(
      i18n: i18n,
      color: color,
      title: name,
      groupId: groupId,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => page,
      ),
    ).then((v) {
      fetch();
    });
  }

  /// 振り返り履歴ページへ移動
  void pushHistory(BuildContext context, String name, int groupId) {
    final PageReflectionHistoryGroup page = PageReflectionHistoryGroup(
      i18n: i18n,
      color: color,
      groupId: groupId,
      title: name,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => page,
      ),
    ).then((v) {
      fetch();
    });
  }

  /// ランク説明ページへ移動
  void pushRankDetail(BuildContext context) {
    final PageRankDetail page = PageRankDetail(
      i18n: i18n,
      color: color,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => page,
      ),
    ).then((v) {
      fetch();
    });
  }

  /// データの更新
  Future<void> fetchCounts() async {
    fetch();
  }

  useEffect(() {
    fetch();
    return;
  }, []);

  return UseReturn(
    reflectionGroups: reflectionGroups.value,
    game: game.value,
    reflectionCount: reflectionCount.value,
    pushReflection: pushReflection,
    pushHistory: pushHistory,
    pushRankDetail: pushRankDetail,
    fetchCounts: fetchCounts,
  );
}
