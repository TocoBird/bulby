import 'package:flutter/material.dart'
    show
        Widget,
        BottomNavigationBarItem,
        Icon,
        Icons,
        BottomNavigationBar,
        BottomNavigationBarType;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

///
Widget view(
  AppLocalizations i18n,
  UseColor color,
  int currentIndex,
  void Function(int) onClickTab,
) {
  /// タブの一覧
  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: const Icon(Icons.mode_edit),
      label: i18n.footerSolution,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.add),
      label: i18n.footerReflection,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.list),
      label: i18n.footerTodo,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.account_circle),
      label: i18n.footerAccount,
    ),
  ];

  return BottomNavigationBar(
    currentIndex: currentIndex,
    backgroundColor: color.base.footer,
    onTap: onClickTab,
    items: items,
    selectedItemColor: color.base.text,
    unselectedItemColor: color.base.textOpacity,
    type: BottomNavigationBarType.fixed,
  );
}
