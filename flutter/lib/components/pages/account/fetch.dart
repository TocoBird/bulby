import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/api/query/controller/account.dart'
    show FetchAccountPage;

class UseReturn {
  const UseReturn({
    required this.reflectionGroups,
    required this.fetchReflectionGroups,
  });

  final List<DomainReflectionGroup> reflectionGroups;
  final Future<void> Function() fetchReflectionGroups;
}

/// データ取得: 振り返りグループ一覧
UseReturn useFetch() {
  final ValueNotifier<List<DomainReflectionGroup>>
      reflectionGroups =
      useState<List<DomainReflectionGroup>>([]);

  /// データ取得
  Future<void> fetch() async {
    final List<DomainReflectionGroup> r =
        await FetchAccountPage().fetchReflectionGroups();
    reflectionGroups.value = r;
  }

  /// 振り返りグループの更新
  Future<void> fetchReflectionGroups() async {
    fetch();
  }

  useEffect(() {
    fetch();
    return;
  }, []);

  return UseReturn(
    reflectionGroups: reflectionGroups.value,
    fetchReflectionGroups: fetchReflectionGroups,
  );
}
