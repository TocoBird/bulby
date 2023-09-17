import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/add_reflection_name/hooks.dart'
    show useHooks;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/add_reflection_name/view.dart'
    show view;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;

/// テンプレート: 振り返り名の追加
class TemplateAddReflectionName extends HookWidget {
  const TemplateAddReflectionName({
    super.key,
    required this.i18n,
    required this.color,
    required this.changeTabPage,
    required this.changeLocale,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 言語を変更する
  final void Function(LocaleCode) changeLocale;

  /// タブを押した
  final void Function() changeTabPage;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(changeTabPage);

    return view(
      context,
      color,
      i18n,
      h.formKey,
      h.textReflectionName,
      h.textFieldFocusNode,
      h.onPressedRegister,
      changeLocale,
    );
  }
}
