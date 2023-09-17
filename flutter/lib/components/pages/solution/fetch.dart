import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Navigator, MaterialPageRoute;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/components/templates/solution/domain/reflection.dart'
    show DomainSolutionReflection;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/api/query/controller/solution.dart'
    show FetchSolutionPage;
import 'package:gamer_reflection/components/pages/solution_detail/widget.dart'
    show PageSolutionDetail;
import 'package:gamer_reflection/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;

class UseReturn {
  const UseReturn({
    required this.reflections,
    required this.reflectionGroups,
    required this.pushSolutionDetail,
    required this.fetchReflections,
  });

  final List<DomainSolutionReflection> reflections;
  final Future<void> Function() fetchReflections;

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  /// タスク詳細へ飛ぶ
  final void Function(BuildContext, int) pushSolutionDetail;
}

/// データ取得: タスク一覧
UseReturn useFetch(
    ValueNotifier<bool> canDC, AppLocalizations i18n, UseColor color) {
  final ValueNotifier<List<DomainSolutionReflection>> reflections =
      useState<List<DomainSolutionReflection>>([]);
  final ValueNotifier<List<DomainReflectionGroup>> reflectionGroups =
      useState<List<DomainReflectionGroup>>([]);

  /// 振り返りグループIDの取得
  int getReflectionGroupId(String? id) {
    if (id != null) return int.parse(id);
    return reflectionGroups.value.isEmpty ? 1 : reflectionGroups.value[0].id;
  }

  /// データ取得
  Future<void> fetch() async {
    if (!canDC.value) return;

    final String? id = await selectReflectionGroupId.get();
    final int groupId = getReflectionGroupId(id);

    final List<DomainSolutionReflection> r =
        await FetchSolutionPage().fetchReflections(groupId);
    reflections.value = r;

    final List<DomainReflectionGroup> rg =
        await FetchSolutionPage().fetchReflectionGroups();
    reflectionGroups.value = rg;
  }

  /// 解決案詳細ページへ移動
  void pushSolutionDetail(BuildContext context, int reflectionId) {
    final PageSolutionDetail page = PageSolutionDetail(
      i18n: i18n,
      color: color,
      reflectionId: reflectionId,
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

  /// 振り返りの更新
  Future<void> fetchReflections() async {
    fetch();
  }

  useEffect(() {
    canDC.addListener(fetch);
    fetch();
    return;
  }, []);

  return UseReturn(
    reflections: reflections.value,
    reflectionGroups: reflectionGroups.value,
    pushSolutionDetail: pushSolutionDetail,
    fetchReflections: fetchReflections,
  );
}
