import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:bulby/components/templates/todo/domain/todo.dart'
    show DomainTodo;
import 'package:bulby/components/templates/todo/view.dart' show view;
import 'package:bulby/components/templates/todo/hooks.dart' show useHooks;

/// テンプレート: やることリスト
class TemplateTodo extends HookWidget {
  const TemplateTodo({
    super.key,
    required this.i18n,
    required this.color,
    required this.reflectionGroups,
    required this.todos,
    required this.fetchTodos,
    required this.pushSolutionDetail,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  /// やること一覧
  final List<DomainTodo>? todos;

  /// やることを取得
  final Future<void> Function() fetchTodos;

  /// 解決案詳細へ飛ぶ
  final void Function(BuildContext, int) pushSolutionDetail;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(reflectionGroups, fetchTodos, todos);

    return view(
      i18n,
      color,
      context,
      h.isSelectedTraining,
      h.filterTodos,
      reflectionGroups,
      h.onChangeReflectionGroup,
      h.onClickRemove,
      h.onPressedGame,
      h.onPressedTraining,
      pushSolutionDetail,
    );
  }
}
