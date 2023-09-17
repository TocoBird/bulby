import 'package:flutter/material.dart' show ValueNotifier, AsyncSnapshot;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useMemoized, useFuture, useEffect;
import 'package:bulby/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;
import 'package:bulby/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:bulby/api/command/controller/todo.dart' show RequestTodo;
import 'package:bulby/components/templates/todo/domain/todo.dart'
    show DomainTodo;
import 'package:bulby/storage/kvs/selected_todo_type.dart' show selectTodoType;

class UseReturn {
  const UseReturn({
    required this.isSelectedTraining,
    required this.filterTodos,
    required this.onChangeReflectionGroup,
    required this.onClickRemove,
    required this.onPressedGame,
    required this.onPressedTraining,
  });
  final bool isSelectedTraining;
  final List<DomainTodo> filterTodos;
  final void Function(String?) onChangeReflectionGroup;
  final void Function(int) onClickRemove;
  final void Function() onPressedGame;
  final void Function() onPressedTraining;
}

/// ロジック: やることページ
UseReturn useHooks(
  List<DomainReflectionGroup> reflectionGroups,
  Future<void> Function() fetchTodos,
  List<DomainTodo>? todos,
) {
  /// 練習/試合を選択
  final ValueNotifier<bool> isSelectedTraining = useState<bool>(false);

  /// 選択しているやることの種類
  /// タブが切り替わったら再度取得
  final Future<String?> memoedTodoType =
      useMemoized(() => selectTodoType.get(), []);
  final AsyncSnapshot<String?> futuredTodoType = useFuture(memoedTodoType);

  /// 振り返りグループ
  void onChangeReflectionGroup(String? id) async {
    String groupId = id ??
        (reflectionGroups.isEmpty ? "1" : reflectionGroups[0].id.toString());
    selectReflectionGroupId.save(groupId);

    await fetchTodos();
  }

  /// やることを削除
  Future<void> onClickRemove(int reflectionId) async {
    // 削除
    await RequestTodo().deleteTodo(reflectionId);

    // 更新
    await fetchTodos();
  }

  /// やることリストの取得
  List<DomainTodo> getTodos() {
    if (todos == null) return [];
    if (isSelectedTraining.value) {
      // 練習
      return todos.where((t) => t.todoType == 2).toList();
    }
    // 試合
    return todos.where((t) => t.todoType == 1).toList();
  }

  /// 試合を押した
  Future<void> onPressedGame() async {
    isSelectedTraining.value = false;

    /// 端末に保存
    await selectTodoType.save("game");
  }

  /// 練習を押した
  Future<void> onPressedTraining() async {
    isSelectedTraining.value = true;

    /// 端末に保存
    await selectTodoType.save("training");
  }

  useEffect(() {
    if (futuredTodoType.data == null) return;

    /// ローカルデータ: やることの種類
    final String r = futuredTodoType.data ?? 'game';
    final bool isTraining = r != "game";
    isSelectedTraining.value = isTraining;

    return;
  }, [futuredTodoType.data]);

  return UseReturn(
    isSelectedTraining: isSelectedTraining.value,
    filterTodos: getTodos(),
    onChangeReflectionGroup: onChangeReflectionGroup,
    onClickRemove: onClickRemove,
    onPressedGame: onPressedGame,
    onPressedTraining: onPressedTraining,
  );
}
