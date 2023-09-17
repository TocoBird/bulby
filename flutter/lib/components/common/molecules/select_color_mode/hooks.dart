import 'package:flutter/material.dart' show AsyncSnapshot, ValueNotifier;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show useState;
import 'package:bulby/components/common/atoms/input/select.dart'
    show SelectItem;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, useMemoized, useFuture;
import 'package:bulby/storage/kvs/selected_color_mode.dart'
    show selectColorMode;

class UseReturn {
  const UseReturn({
    required this.onChanged,
    required this.colors,
    required this.colorMode,
  });

  final Function(String? t) onChanged;
  final List<SelectItem> colors;
  final String colorMode;
}

///
UseReturn useHooks(
  AppLocalizations i18n,
  UseColor color,
) {
  /// 選択している期間
  final Future<String?> memoedColorMode =
      useMemoized(() => selectColorMode.get());
  final AsyncSnapshot<String?> futuredColorMode = useFuture(memoedColorMode);

  /// 選択カラーモード
  ValueNotifier<String> colorMode = useState<String>("dark");

  /// 変更を押した
  void onChanged(String? t) {
    final c = t ?? "dark";
    selectColorMode.save(c);
    color.changeColor(c);
  }

  /// カラーモード
  final List<SelectItem> colors = [
    SelectItem(text: i18n.commonSelectColorModeDark, value: 'dark'),
    SelectItem(text: i18n.commonSelectColorModeLight, value: 'light'),
  ];

  useEffect(() {
    if (futuredColorMode.data == null) return;

    /// 初期選択言語
    colorMode.value = futuredColorMode.data ?? "dark";
    return;
  }, [futuredColorMode.data]);

  return UseReturn(
    onChanged: onChanged,
    colors: colors,
    colorMode: colorMode.value,
  );
}
