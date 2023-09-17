import 'package:flutter/material.dart' show AsyncSnapshot, ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, useState, useMemoized, useFuture;
import 'package:gamer_reflection/components/common/atoms/input/select.dart'
    show SelectItem;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;

class UseReturn {
  const UseReturn({
    required this.reflectionNames,
    required this.reflectionId,
    required this.onChanged,
  });
  final List<SelectItem> reflectionNames;
  final String? reflectionId;
  final void Function(String?) onChanged;
}

///
UseReturn useHooks(
  List<DomainReflectionGroup> reflectionGroups,
  final void Function(String?) onChanged,
) {
  /// 選択しているグループID
  final Future<String?> memoedReflectionGroupId =
      useMemoized(() => selectReflectionGroupId.get(), [reflectionGroups]);
  final AsyncSnapshot<String?> futuredReflectionGroupId =
      useFuture(memoedReflectionGroupId);

  /// 選択グループID
  ValueNotifier<String?> reflectionId = useState<String?>(null);

  /// 変更を押した
  void onChangedSelect(String? t) {
    selectReflectionGroupId.save(t ?? '');
    onChanged(t);
  }

  /// 選択IDの取得
  String? getReflectionId(String? id) {
    // 問題なければキャッシュされたIDを返す
    if (id != null && id.isNotEmpty) return id;
    // IDが空文字でかつ、グループが存在すれば、先頭のグループを返す
    if (id != null && id.isEmpty && reflectionGroups.isNotEmpty) {
      return reflectionGroups[0].id.toString();
    }
    // idがnullで未設定なら、先頭のグループを返す
    if (reflectionGroups.isNotEmpty) return reflectionGroups[0].id.toString();
    // 該当がなければnullで非表示
    return null;
  }

  /// 選択IDの更新
  void updateReflectionId(String? id) {
    reflectionId.value = getReflectionId(id);
  }

  /// 振り返りグループ名一覧
  final List<SelectItem> reflectionNames = reflectionGroups
      .map(
        (r) => SelectItem(
          text: r.name,
          value: r.id.toString(),
        ),
      )
      .toList();

  useEffect(() {
    /// 初期選択グループ
    updateReflectionId(futuredReflectionGroupId.data);
    return;
  }, [futuredReflectionGroupId.data]);

  return UseReturn(
    reflectionNames: reflectionNames,
    reflectionId: reflectionId.value,
    onChanged: onChangedSelect,
  );
}
