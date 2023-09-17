import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/account_setting/widget.dart'
    show TemplateAccountSetting;
import 'package:gamer_reflection/components/pages/account/fetch.dart'
    show useFetch;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;

/// ページ: アカウント設定
class PageAccountSetting extends HookWidget {
  const PageAccountSetting({
    super.key,
    required this.i18n,
    required this.changeLocale,
    required this.color,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 言語を変更する
  final void Function(LocaleCode) changeLocale;

  @override
  Widget build(BuildContext context) {
    final d = useFetch();

    return Scaffold(
      body: TemplateAccountSetting(
        i18n: i18n,
        color: color,
        changeLocale: changeLocale,
        reflectionGroups: d.reflectionGroups,
        fetchReflectionGroups: d.fetchReflectionGroups,
      ),
    );
  }
}
