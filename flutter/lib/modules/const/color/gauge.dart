import 'package:flutter/material.dart' show Color;

class ColorGauge {
  const ColorGauge({
    required this.gauge,
    required this.background,
  });

  /// ゲージ: ゲージ色
  final Color gauge;

  /// ゲージ: 背景色
  final Color background;
}

ColorGauge colorGauge(bool isDark) {
  gauge() {
    if (isDark) return ConstantColorGaugeDark.gauge;
    return ConstantColorGaugeLight.gauge;
  }

  background() {
    if (isDark) return ConstantColorGaugeDark.background;
    return ConstantColorGaugeLight.background;
  }

  return ColorGauge(
    gauge: gauge(),
    background: background(),
  );
}

/// 用途ごとに色を定義する: ゲージ: ダークモード
class ConstantColorGaugeDark {
  ConstantColorGaugeDark._();

  /// ゲージ: ゲージ色
  static const Color gauge = Color.fromARGB(255, 40, 88, 221);

  /// ゲージ: 背景色
  static const Color background = Color.fromARGB(255, 197, 197, 213);
}

/// 用途ごとに色を定義する: ゲージ: ライトモード
class ConstantColorGaugeLight {
  ConstantColorGaugeLight._();

  /// ゲージ: ゲージ色
  static const Color gauge = Color.fromARGB(255, 40, 88, 221);

  /// ゲージ: 背景色
  static const Color background = Color.fromARGB(255, 197, 197, 213);
}
