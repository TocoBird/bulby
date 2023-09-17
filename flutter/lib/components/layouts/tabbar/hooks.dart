import 'package:flutter/material.dart' show Widget, ValueNotifier, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show useState;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:gamer_reflection/components/pages/account/widget.dart'
    show PageAccountSetting;
import 'package:gamer_reflection/components/pages/solution/widget.dart'
    show PageSolution;
import 'package:gamer_reflection/components/pages/todo/widget.dart'
    show PageTodo;
import 'package:gamer_reflection/components/pages/reflection/widget.dart'
    show PageReflection;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

class UseReturn {
  const UseReturn({
    required this.i18n,
    required this.selectedIndex,
    required this.onClickTab,
    required this.tabPage,
  });

  final AppLocalizations i18n;
  final int selectedIndex;
  final void Function(int) onClickTab;
  final Widget Function(ValueNotifier<bool>, UseColor) tabPage;
}

/// Hooks: TabBar
UseReturn useHooks(
  BuildContext context,
  void Function(LocaleCode) changeLocale,
) {
  ///
  final ValueNotifier<int> selectedIndex = useState<int>(0);

  /// 言語
  final i18n = AppLocalizations.of(context)!;

  /// タブがクリックされた
  void onClickTab(int index) {
    selectedIndex.value = index;
  }

  /// タブを押すと表示するページ
  Widget tabPage(ValueNotifier<bool> canDC, UseColor color) {
    final List<Widget> pages = [
      PageSolution(
        i18n: i18n,
        color: color,
        canDC: canDC,
      ),
      PageReflection(
        i18n: i18n,
        color: color,
      ),
      PageTodo(
        i18n: i18n,
        color: color,
      ),
      PageAccountSetting(
        i18n: i18n,
        changeLocale: changeLocale,
        color: color,
      ),
    ];
    return pages[selectedIndex.value];
  }

  return UseReturn(
    i18n: i18n,
    selectedIndex: selectedIndex.value,
    tabPage: tabPage,
    onClickTab: onClickTab,
  );
}
