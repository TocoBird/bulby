import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/templates/account_setting/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/components/templates/account_setting/view.dart'
    show view;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;

/// テンプレート: アカウント設定
class TemplateAccountSetting extends HookWidget {
  const TemplateAccountSetting({
    super.key,
    required this.i18n,
    required this.color,
    required this.changeLocale,
    required this.reflectionGroups,
    required this.fetchReflectionGroups,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 言語を変更する
  final void Function(LocaleCode) changeLocale;

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  ///
  final Future<void> Function() fetchReflectionGroups;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(
      i18n,
      color,
      context,
      reflectionGroups,
      fetchReflectionGroups,
    );

    return view(
      i18n,
      color,
      context,
      changeLocale,
      reflectionGroups,
      h.onPressedEdit,
      h.onPressedDelete,
      h.onPressedNewName,
      h.onChangeReflectionGroup,
      h.textReflectionName,
      h.textReflectionNameFocusNode,
      h.textReflectionNewName,
      h.textReflectionNewNameFocusNode,
      h.formKeyNewName,
      h.formKeyEditName,
    );
  }
}
