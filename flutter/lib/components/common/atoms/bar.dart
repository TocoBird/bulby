import 'package:flutter/material.dart'
    show StatelessWidget, Color, Widget, BuildContext, Divider;

/// 線
class Bar extends StatelessWidget {
  const Bar({
    super.key,
    required this.color,
  });

  /// 色
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: color,
    );
  }
}
