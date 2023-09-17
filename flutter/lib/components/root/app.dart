import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        MaterialApp,
        ThemeData,
        VisualDensity,
        SizedBox,
        Container;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show useColor;
import 'package:gamer_reflection/components/layouts/tabbar/tabbar.dart'
    show Tabbar;
import 'package:gamer_reflection/components/pages/add_reflection_name/widget.dart'
    show PageAddReflectionName;
import 'package:gamer_reflection/components/root/hooks.dart' show useHooks;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

/// ページ: ルート
class App extends HookWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = useHooks(context);
    final c = useColor();

    /// コンテンツ
    home() {
      final isFirstPage = h.isNoSetReflectionGroup;

      if (isFirstPage == null) {
        return Container(
          color: c.base.content,
          child: const SizedBox(),
        );
      }

      // 初回ページ
      if (isFirstPage) {
        return PageAddReflectionName(
          color: c,
          changeTabPage: h.changeTabPage,
          changeLocale: h.changeLocale,
        );
      }

      // メインページ
      return Tabbar(
        color: c,
        canDC: h.canDC,
        changeLocale: h.changeLocale,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: h.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: h.supportedLocales,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home(),
    );
  }
}
