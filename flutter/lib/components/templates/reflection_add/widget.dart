import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/templates/reflection_add/hooks.dart'
    show useHooks;
import 'package:bulby/components/templates/reflection_add/domain/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:bulby/components/templates/reflection_add/domain/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:bulby/components/templates/reflection_add/view.dart' show view;

/// テンプレート: 振り返りの追加
class TemplateReflectionAdd extends HookWidget {
  const TemplateReflectionAdd({
    super.key,
    required this.i18n,
    required this.color,
    required this.reflections,
    required this.title,
    required this.groupId,
    required this.addedReflectionsFromOtherPage,
    required this.pushReflectionAddedList,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 振り返りの一覧
  final List<DomainReflectionAddReflection> reflections;

  /// 追加した振り返り一覧
  final List<DomainReflectionAdded> addedReflectionsFromOtherPage;

  /// タイトル
  final String title;

  /// 振り返りグループID
  final int groupId;

  /// 追加した振り返り一覧ページへ移動
  final Function(BuildContext, List<DomainReflectionAdded>)
      pushReflectionAddedList;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(
      i18n,
      color,
      context,
      reflections,
      addedReflectionsFromOtherPage,
      groupId,
      pushReflectionAddedList,
    );

    return view(
      i18n,
      color,
      context,
      reflections,
      title,
      h.badgeNumForListener,
      h.textFieldFocusNode,
      h.formKey,
      h.textReflection,
      h.onPressedAddReflection,
      h.onPressedAddCandidate,
      h.onPressedReflectionDone,
      h.onPressedRemoveText,
      h.onChangeTextReflection,
      h.candidatesForListener,
      h.onWillPop,
    );
  }
}
