import 'package:flutter/material.dart'
    show StatelessWidget, Widget, BuildContext, Image, Color;

/// ロゴアイコン
class IconLogo extends StatelessWidget {
  const IconLogo({
    super.key,
    required this.color,
    required this.width,
    required this.height,
  });

  /// カラーの設定
  final Color color;

  /// 横幅
  final double width;

  /// 縦幅
  final double height;

  @override
  Widget build(BuildContext context) {
    const path = 'images/BulbyLogo.png';
    return Image.asset(
      path,
      width: width,
      height: height,
      color: color,
    );
  }
}
