import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Navigator, MaterialPageRoute;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/components/templates/reflection_add/domain/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:gamer_reflection/components/templates/reflection_add/domain/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:gamer_reflection/api/query/controller/reflection_add.dart'
    show FetchReflectionAddPage;
import 'package:gamer_reflection/components/pages/reflection_added_list/widget.dart'
    show PageReflectionAddedList;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;

class UseReturn {
  const UseReturn({
    required this.reflections,
    required this.addedReflectionsFromOtherPage,
    required this.fetchReflections,
    required this.pushReflectionAddedList,
  });

  final List<DomainReflectionAddReflection> reflections;
  final List<DomainReflectionAdded> addedReflectionsFromOtherPage;
  final Future<void> Function() fetchReflections;
  final void Function(BuildContext, bool, List<DomainReflectionAdded>)
      pushReflectionAddedList;
}

/// データ取得: 振り返り追加
UseReturn useFetch(int groupId, AppLocalizations i18n, UseColor color) {
  final ValueNotifier<List<DomainReflectionAddReflection>> reflections =
      useState<List<DomainReflectionAddReflection>>([]);
  ValueNotifier<List<DomainReflectionAdded>> addedReflectionsFromOtherPage =
      useState<List<DomainReflectionAdded>>([]);

  /// データの取得
  Future<void> fetch(List<DomainReflectionAdded> addeds) async {
    final List<DomainReflectionAddReflection> rs =
        await FetchReflectionAddPage().fetchReflections(groupId);
    List<DomainReflectionAddReflection> mergedRs = [];

    // 候補一覧を更新する
    mergedRs = rs.map((d) {
      // 別ページからの振り返りがあればcountを増やす
      final sameReflection = addeds.firstWhere(
        (e) => e.text == d.text,
        orElse: () => const DomainReflectionAdded(
          text: "",
          count: 0,
          reflectionType: ReflectionType.good,
        ),
      );

      return DomainReflectionAddReflection(
        text: d.text,
        count: d.count + sameReflection.count,
      );
    }).toList();

    // 別ページからの振り返りを追加
    for (DomainReflectionAdded r in addeds) {
      final reflectionExist = rs.map((e) => e.text).contains(r.text);
      if (reflectionExist) continue;

      mergedRs.add(
        DomainReflectionAddReflection(
          text: r.text,
          count: r.count,
        ),
      );
    }

    /// 大きい順にソート
    mergedRs.sort(((a, b) => b.count.compareTo(a.count)));

    reflections.value = mergedRs;
  }

  /// 振り返りグループの更新
  Future<void> fetchReflections() async {
    await fetch([]);
  }

  /// 追加している振り返りページへ移動
  void pushReflectionAddedList(
    BuildContext c,
    bool isSavePage,
    List<DomainReflectionAdded> reflections,
  ) {
    final PageReflectionAddedList page = PageReflectionAddedList(
      i18n: i18n,
      color: color,
      reflections: reflections,
      groupId: groupId,
      isSavePage: isSavePage,
    );
    Navigator.push(
      c,
      MaterialPageRoute(
        builder: (c) => page,
      ),
    ).then((v) {
      if (v == null) return;

      addedReflectionsFromOtherPage.value = v;
      fetch(v);
    });
  }

  useEffect(() {
    fetch([]);
    return;
  }, []);

  return UseReturn(
    reflections: reflections.value,
    addedReflectionsFromOtherPage: addedReflectionsFromOtherPage.value,
    fetchReflections: fetchReflections,
    pushReflectionAddedList: pushReflectionAddedList,
  );
}
