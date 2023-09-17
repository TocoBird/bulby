import 'package:flutter/material.dart' show AsyncSnapshot, ValueNotifier;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ColorBase, colorBase;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ColorButton, colorButton;
import 'package:gamer_reflection/modules/const/color/gauge.dart'
    show ColorGauge, colorGauge;
import 'package:gamer_reflection/modules/const/color/input.dart'
    show ColorInput, colorInput;
import 'package:gamer_reflection/modules/const/color/text_tag.dart'
    show ColorTextTag, colorTextTag;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useMemoized, useFuture, useEffect, useState;
import 'package:gamer_reflection/storage/kvs/selected_color_mode.dart'
    show selectColorMode;

class UseColor {
  const UseColor({
    required this.changeColor,
    required this.isDark,
    required this.isLight,
    required this.base,
    required this.button,
    required this.gauge,
    required this.input,
    required this.textTag,
  });

  /// 色を変更する
  final Function changeColor;

  /// ダークモードか
  final bool isDark;

  /// ライトモードか
  final bool isLight;

  /// 色: 基本的なもの
  final ColorBase base;

  /// 色: ボタン
  final ColorButton button;

  /// 色: 経験値ゲージ
  final ColorGauge gauge;

  /// 色: input
  final ColorInput input;

  /// 色: タグ
  final ColorTextTag textTag;
}

UseColor useColor() {
  /// 選択している期間
  final Future<String?> memoedColorMode =
      useMemoized(() => selectColorMode.get());
  final AsyncSnapshot<String?> futuredColorMode = useFuture(memoedColorMode);

  /// 選択カラー
  ValueNotifier<String> colorMode = useState<String>('dark');

  useEffect(() {
    if (futuredColorMode.data == null) return;
    colorMode.value = futuredColorMode.data ?? "dark";
    return;
  }, [futuredColorMode.data]);

  /// 色モード変更
  changeColor(String mode) => colorMode.value = mode;

  /// カラーモードはダーク
  isDark() => colorMode.value == 'dark';

  /// カラーモードはライト
  isLight() => colorMode.value == 'light';

  return UseColor(
    changeColor: changeColor,
    isDark: isDark(),
    isLight: isLight(),
    base: colorBase(isDark()),
    button: colorButton(isDark()),
    gauge: colorGauge(isDark()),
    input: colorInput(isDark()),
    textTag: colorTextTag(isDark()),
  );
}
