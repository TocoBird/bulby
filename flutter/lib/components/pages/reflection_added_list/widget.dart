import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/templates/reflection_added_list/widget.dart'
    show TemplateReflectionAddedList;
import 'package:bulby/components/templates/reflection_add/domain/reflection_added.dart'
    show DomainReflectionAdded;

/// ページ: 追加ページにて一時的に追加した振り返りの一覧
class PageReflectionAddedList extends HookWidget {
  const PageReflectionAddedList({
    super.key,
    required this.i18n,
    required this.color,
    required this.reflections,
    required this.groupId,
    required this.isSavePage,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 振り返りの一覧
  final List<DomainReflectionAdded> reflections;

  /// 振り返りグループID
  final int groupId;

  /// 入力確認ページか、一次確認ページか
  /// todo: pageを分ける
  final bool isSavePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplateReflectionAddedList(
        i18n: i18n,
        color: color,
        reflections: reflections,
        groupId: groupId,
        isSavePage: isSavePage,
      ),
    );
  }
}
