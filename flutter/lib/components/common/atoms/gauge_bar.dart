import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        ClipRRect,
        BorderRadius,
        Radius,
        LinearProgressIndicator,
        AlwaysStoppedAnimation;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;

/// ゲージのバー
class GaugeBar extends StatelessWidget {
  const GaugeBar({
    super.key,
    required this.color,
    required this.percent,
  });

  /// カラーの設定
  final UseColor color;

  final double percent;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: LinearProgressIndicator(
        value: percent,
        valueColor: AlwaysStoppedAnimation(color.gauge.gauge),
        backgroundColor: color.gauge.background,
        minHeight: 8,
      ),
    );
  }
}
