import 'package:flutter/material.dart'
    show StatelessWidget, Widget, BuildContext, ColorFilter, Color, BlendMode;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

/// ロゴアイコン
class IconLogo extends StatelessWidget {
  const IconLogo({
    super.key,
    required this.color,
    required this.width,
    required this.height,
  });

  /// カラーの設定
  final UseColor color;

  /// 横幅
  final double width;

  /// 縦幅
  final double height;

  @override
  Widget build(BuildContext context) {
    const path = 'images/BulbyLogo.svg';
    return SvgPicture.asset(
      path,
      height: height,
      width: width,
      colorFilter: ColorFilter.mode(
        color.base.textOpacity,
        BlendMode.srcIn,
      ),
    );
  }
}
