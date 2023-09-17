import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection_added_list/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/components/templates/reflection_add/domain/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:gamer_reflection/components/templates/reflection_added_list/view.dart'
    show view;

/// テンプレート: 振り返りで追加した内容一覧
class TemplateReflectionAddedList extends HookWidget {
  const TemplateReflectionAddedList({
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

  /// todo: pageを分ける
  final bool isSavePage;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(
      i18n,
      color,
      context,
      reflections,
      groupId,
    );

    return view(
      i18n,
      color,
      context,
      isSavePage,
      h.reflectionsOnPage,
      h.onWillPop,
      h.onClickRemove,
      h.onPressedReflectionDone,
    );
  }
}
