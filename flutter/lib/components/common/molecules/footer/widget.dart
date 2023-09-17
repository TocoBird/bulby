import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/molecules/footer/view.dart' show view;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;

/// Footer
class Footer extends HookWidget {
  const Footer({
    super.key,
    required this.i18n,
    required this.color,
    required this.selectedIndex,
    required this.onClickTab,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 選択しているタブ
  final int selectedIndex;

  /// タブがクリックされた
  final void Function(int) onClickTab;

  @override
  Widget build(BuildContext context) {
    return view(
      i18n,
      color,
      selectedIndex,
      onClickTab,
    );
  }
}
