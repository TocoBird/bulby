import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:bulby/components/templates/reflection_history/domain/reflection_history.dart'
    show DomainReflectionHistory;
import 'package:bulby/api/query/controller/reflection_history.dart'
    show FetchReflectionHistoryPage;

class UseReturn {
  const UseReturn({
    required this.historys,
  });

  final List<DomainReflectionHistory> historys;
}

/// データ取得: 振り返り履歴グループ詳細
UseReturn useFetch(int historyGroupId) {
  final ValueNotifier<List<DomainReflectionHistory>> historys =
      useState<List<DomainReflectionHistory>>([]);

  /// データ取得
  Future<void> fetch() async {
    final List<DomainReflectionHistory> r = await FetchReflectionHistoryPage()
        .fetchReflectionHistory(historyGroupId);
    historys.value = r;
  }

  useEffect(() {
    fetch();
    return;
  }, []);

  return UseReturn(
    historys: historys.value,
  );
}
