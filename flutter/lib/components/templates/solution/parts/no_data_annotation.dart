import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/icon/icon_logo.dart'
    show IconLogo;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// タスク一覧: データがまだない
class SolutionNoDataAnnotation extends StatelessWidget {
  const SolutionNoDataAnnotation({
    super.key,
    required this.i18n,
    required this.color,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpacerHeight.xl,
          IconLogo(
            color: color.base.textOpacity,
            width: ConstantSizeUI.l7,
            height: ConstantSizeUI.l7,
          ),
          SpacerHeight.m,
          TextAnnotation(
            color: color,
            text: i18n.pageSolutionNoList,
            size: "M",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
