import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/templates/todo/widget.dart' show TemplateTodo;
import 'package:bulby/components/pages/todo/fetch.dart' show useFetch;

/// ページ: やることリスト
class PageTodo extends HookWidget {
  const PageTodo({
    super.key,
    required this.i18n,
    required this.color,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(i18n, color);

    return Scaffold(
      body: TemplateTodo(
        i18n: i18n,
        color: color,
        reflectionGroups: d.reflectionGroups,
        pushSolutionDetail: d.pushSolutionDetail,
        todos: d.todos,
        fetchTodos: d.fetchTodos,
      ),
    );
  }
}
