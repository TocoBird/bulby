import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:bulby/components/templates/solution_detail/domain/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:bulby/api/query/controller/solution_detail.dart'
    show FetchSolutionDetailPage;
import 'package:bulby/modules/type/data_fetch.dart' show DataFetchState;

class UseReturn {
  const UseReturn({
    required this.reflection,
    required this.reflectionGroupId,
    required this.todoCount,
    required this.updateReflection,
    required this.dataFetchState,
    required this.todoExist,
  });

  final DomainSolutionDetailReflection? reflection;
  final int reflectionGroupId;
  final int todoCount;
  final Future<void> Function() updateReflection;
  final DataFetchState dataFetchState;
  final bool? todoExist;
}

/// データ取得: タスク詳細
UseReturn useFetch(int reflectionId) {
  final ValueNotifier<DomainSolutionDetailReflection?> reflection =
      useState<DomainSolutionDetailReflection?>(null);
  final ValueNotifier<DataFetchState> dataFetchState =
      useState<DataFetchState>(DataFetchState.none);
  final ValueNotifier<bool?> todoExist = useState<bool?>(null);
  // やること総数
  final ValueNotifier<int> todoCount = useState<int>(0);
  // グループID
  final ValueNotifier<int> reflectionGroupId = useState<int>(0);

  /// データ取得
  Future<void> eventRepository() async {
    dataFetchState.value = DataFetchState.fetching;

    final DomainSolutionDetailReflection r =
        await FetchSolutionDetailPage().fetchReflectionById(reflectionId);

    reflection.value = r;
    dataFetchState.value = DataFetchState.end;

    final bool t =
        await FetchSolutionDetailPage().fetchTodoExistById(reflectionId);
    todoExist.value = t;

    final int count = await FetchSolutionDetailPage().fetchTodoCount(r.groupId);
    todoCount.value = count;
    reflectionGroupId.value = r.groupId;
  }

  ///
  Future<void> updateReflection() async {
    await eventRepository();
  }

  useEffect(() {
    eventRepository();
    return;
  }, []);

  return UseReturn(
    reflection: reflection.value,
    reflectionGroupId: reflectionGroupId.value,
    todoCount: todoCount.value,
    updateReflection: updateReflection,
    dataFetchState: dataFetchState.value,
    todoExist: todoExist.value,
  );
}
