import 'package:flutter/material.dart' show Widget, BuildContext, FocusNode;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/atoms/input/select.dart'
    show InputSelect;
import 'package:gamer_reflection/components/common/molecules/select_color_mode/hooks.dart'
    show useHooks;

/// カラーモード選択
class SelectColorMode extends HookWidget {
  const SelectColorMode({
    super.key,
    required this.i18n,
    required this.color,
    this.focusNode,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// フォーカスノード
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(i18n, color);

    return InputSelect(
      color: color,
      items: h.colors,
      value: h.colorMode,
      onChanged: h.onChanged,
      focusNode: focusNode,
    );
  }
}
