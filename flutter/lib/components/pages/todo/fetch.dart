import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Navigator, MaterialPageRoute;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:bulby/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:bulby/components/templates/todo/domain/todo.dart'
    show DomainTodo;
import 'package:bulby/api/query/controller/todo.dart' show FetchTodoPage;
import 'package:bulby/components/pages/solution_detail/widget.dart'
    show PageSolutionDetail;
import 'package:bulby/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;

class UseReturn {
  const UseReturn({
    required this.reflectionGroups,
    required this.todos,
    required this.pushSolutionDetail,
    required this.fetchTodos,
  });

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  /// やること一覧
  final List<DomainTodo>? todos;

  /// 取得
  final Future<void> Function() fetchTodos;

  /// タスク詳細へ飛ぶ
  final void Function(BuildContext, int) pushSolutionDetail;
}

/// データ取得: タスク一覧
UseReturn useFetch(AppLocalizations i18n, UseColor color) {
  final ValueNotifier<List<DomainReflectionGroup>> reflectionGroups =
      useState<List<DomainReflectionGroup>>([]);
  final ValueNotifier<List<DomainTodo>?> todos =
      useState<List<DomainTodo>?>(null);

  /// 振り返りグループIDの取得
  int getReflectionGroupId(String? id) {
    if (id != null) return int.parse(id);
    return reflectionGroups.value.isEmpty ? 1 : reflectionGroups.value[0].id;
  }

  /// データ取得
  Future<void> fetch() async {
    final String? id = await selectReflectionGroupId.get();
    final int groupId = getReflectionGroupId(id);

    // 振り返りグループの取得
    final List<DomainReflectionGroup> rg =
        await FetchTodoPage().fetchReflectionGroups();
    reflectionGroups.value = rg;

    // やることの取得
    final List<DomainTodo> tds = await FetchTodoPage().fetchTodos(groupId);
    todos.value = tds;
  }

  /// やることリスト取得
  Future<void> fetchTodos() async {
    fetch();
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

  useEffect(() {
    fetch();
    return;
  }, []);

  return UseReturn(
    reflectionGroups: reflectionGroups.value,
    todos: todos.value,
    fetchTodos: fetchTodos,
    pushSolutionDetail: pushSolutionDetail,
  );
}
