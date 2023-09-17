import 'package:flutter/material.dart' show Widget, BuildContext, FocusNode;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:bulby/components/common/atoms/input/select.dart'
    show InputSelect;
import 'package:bulby/components/common/molecules/select_language/hooks.dart'
    show useHooks;
import 'package:bulby/modules/type/locale.dart' show LocaleCode;

/// 言語選択
class SelectLanguage extends HookWidget {
  const SelectLanguage({
    super.key,
    required this.color,
    required this.changeLocale,
    this.focusNode,
  });

  /// 言語を変更する
  final void Function(LocaleCode) changeLocale;

  /// カラーの設定
  final UseColor color;

  /// フォーカスノード
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(
      context,
      changeLocale,
    );

    return InputSelect(
      color: color,
      items: h.languages,
      value: h.language,
      onChanged: h.onChanged,
      focusNode: focusNode,
    );
  }
}
