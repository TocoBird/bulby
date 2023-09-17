import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useEffect, useMemoized, useFuture;
import 'package:gamer_reflection/components/templates/solution/domain/reflection.dart'
    show DomainSolutionReflection;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/type.dart'
    show Period;
import 'package:gamer_reflection/components/templates/solution/filter.dart'
    show
        getFilteredPeriod,
        getFilteredReflectionType,
        getTagColor,
        getPriority,
        getHighPriorityIds;
import 'package:gamer_reflection/storage/kvs/selected_period.dart'
    show selectedTaskPagePeriod;
import 'package:gamer_reflection/storage/kvs/selected_reflection_type.dart'
    show selectReflectionType;

class UseReturn {
  const UseReturn({
    required this.period,
    required this.filteredReflections,
    required this.isSelectedGood,
    required this.onPressedLeft,
    required this.onPressedCenter,
    required this.onPressedRight,
    required this.onPressedBad,
    required this.onPressedGood,
    required this.onChangeReflectionGroup,
  });

  final Period period;
  final List<DomainSolutionReflection> filteredReflections;
  final bool isSelectedGood;
  final Future<void> Function() onPressedLeft;
  final Future<void> Function() onPressedCenter;
  final Future<void> Function() onPressedRight;
  final Future<void> Function() onPressedBad;
  final Future<void> Function() onPressedGood;
  final void Function(String?) onChangeReflectionGroup;
}

/// ロジック: タスクページ
UseReturn useHooks(
  List<DomainSolutionReflection> reflections,
  List<DomainReflectionGroup> reflectionGroups,
  Future<void> Function() fetchReflections,
) {
  /// 期間: 初期値は3ヶ月
  final ValueNotifier<Period> period = useState<Period>(Period.centerButton);

  /// 改善すること伸ばすことを選択
  final ValueNotifier<bool> isSelectedGood = useState<bool>(false);

  /// 選択している期間
  final Future<String?> memoedPeriod =
      useMemoized(() => selectedTaskPagePeriod.get(), [period.value]);
  final AsyncSnapshot<String?> futuredPeriod = useFuture(memoedPeriod);

  /// 選択している振り返り種類
  final Future<String?> memoedReflectionType =
      useMemoized(() => selectReflectionType.get(), [isSelectedGood.value]);
  final AsyncSnapshot<String?> futuredReflectionType =
      useFuture(memoedReflectionType);

  /// フィルターされた振り返り一覧
  final ValueNotifier<List<DomainSolutionReflection>> filteredReflections =
      useState<List<DomainSolutionReflection>>([]);

  /// 振り返り一覧取得
  List<DomainSolutionReflection> adapterReflections(
      List<DomainSolutionReflection> domains) {
    /// 大きい順にソート
    domains.sort(((a, b) => b.count.compareTo(a.count)));

    /// 重複しないCount一覧
    final List<int> countDistincts = getHighPriorityIds(domains);

    /// ドメインに変換
    final domain = domains.map(
      (e) {
        final priority = getPriority(countDistincts, e.count);

        return DomainSolutionReflection(
          id: e.id,
          text: e.text,
          count: e.count,
          reflectionType: ReflectionType.bad,
          priority: getPriority(countDistincts, e.count),
          tagColor: getTagColor(priority),
          updatedAt: e.updatedAt,
        );
      },
    );

    return domain.toList();
  }

  /// 振り返り一覧を更新
  void updateFilteredReflections(Period p, bool isGood) {
    /// 良かった悪かったでフィルターする
    final reflectionType = isGood ? ReflectionType.good : ReflectionType.bad;
    final List<DomainSolutionReflection> filteredReflectionTypeReflections =
        getFilteredReflectionType(reflections, reflectionType);

    /// 期間でフィルターする
    final List<DomainSolutionReflection> filteredPeriodReflections =
        getFilteredPeriod(p, filteredReflectionTypeReflections);
    filteredReflections.value = adapterReflections(filteredPeriodReflections);
  }

  /// 期間選択: 左をクリック
  /// 全期間
  Future<void> onPressedLeft() async {
    period.value = Period.leftButton;
    updateFilteredReflections(Period.leftButton, isSelectedGood.value);

    /// 端末に保存
    await selectedTaskPagePeriod.save("period-button-left");
  }

  /// 期間選択: 真ん中をクリック
  /// 3ヶ月
  Future<void> onPressedCenter() async {
    period.value = Period.centerButton;
    updateFilteredReflections(Period.centerButton, isSelectedGood.value);

    /// 端末に保存
    await selectedTaskPagePeriod.save("period-button-center");
  }

  /// 期間選択: 右をクリック
  /// 1週間
  Future<void> onPressedRight() async {
    period.value = Period.rightButton;
    updateFilteredReflections(Period.rightButton, isSelectedGood.value);

    /// 端末に保存
    await selectedTaskPagePeriod.save("period-button-right");
  }

  /// 改善することボタンを押した
  Future<void> onPressedBad() async {
    isSelectedGood.value = false;
    updateFilteredReflections(period.value, false);

    /// 端末に保存
    await selectReflectionType.save("bad");
  }

  /// 伸ばすことボタンを押した
  Future<void> onPressedGood() async {
    isSelectedGood.value = true;
    updateFilteredReflections(period.value, true);

    /// 端末に保存
    await selectReflectionType.save("good");
  }

  /// 振り返りグループが変更された
  void onChangeReflectionGroup(String? id) {
    fetchReflections();
  }

  /// 端末に保存されてる選択している期間を取得
  Period getPeriodByKVS(String kvsString) {
    switch (kvsString) {
      case "period-button-left":
        return Period.leftButton;
      case "period-button-center":
        return Period.centerButton;
      case "period-button-right":
        return Period.rightButton;
      default:
        return Period.leftButton;
    }
  }

  useEffect(() {
    /// ローカルデータ: 選択期間
    final String p = futuredPeriod.data ?? 'period-button-center';
    final Period kvsPeriod = getPeriodByKVS(p);
    period.value = kvsPeriod;

    /// ローカルデータ: 振り返り種類
    final String r = futuredReflectionType.data ?? 'bad';
    final bool isGood = r == "good";
    isSelectedGood.value = isGood;

    /// 初期値は「3ヶ月,改善点」でフィルターする
    updateFilteredReflections(kvsPeriod, isGood);

    return;
  }, [reflections]);

  return UseReturn(
    period: period.value,
    filteredReflections: filteredReflections.value,
    isSelectedGood: isSelectedGood.value,
    onPressedLeft: onPressedLeft,
    onPressedCenter: onPressedCenter,
    onPressedRight: onPressedRight,
    onPressedBad: onPressedBad,
    onPressedGood: onPressedGood,
    onChangeReflectionGroup: onChangeReflectionGroup,
  );
}
