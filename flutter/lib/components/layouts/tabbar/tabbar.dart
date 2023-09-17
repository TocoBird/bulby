import 'package:flutter/material.dart'
    show Widget, BuildContext, Scaffold, ValueNotifier;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/molecules/footer/widget.dart'
    show Footer;
import 'package:gamer_reflection/components/layouts/tabbar/hooks.dart'
    show useHooks;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;

/// home
Scaffold view(
  AppLocalizations i18n,
  UseColor color,
  Widget tabPage,
  int selectedIndex,
  void Function(int) onClickTab,
) {
  return Scaffold(
    body: tabPage,
    bottomNavigationBar: Footer(
      color: color,
      i18n: i18n,
      onClickTab: onClickTab,
      selectedIndex: selectedIndex,
    ),
  );
}

/// Tabbar
class Tabbar extends HookWidget {
  const Tabbar({
    super.key,
    required this.canDC,
    required this.color,
    required this.changeLocale,
  });

  final ValueNotifier<bool> canDC;

  /// カラーの設定
  final UseColor color;

  /// 言語を変更する
  final void Function(LocaleCode) changeLocale;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(context, changeLocale);

    return view(
      h.i18n,
      color,
      h.tabPage(canDC, color),
      h.selectedIndex,
      h.onClickTab,
    );
  }
}
