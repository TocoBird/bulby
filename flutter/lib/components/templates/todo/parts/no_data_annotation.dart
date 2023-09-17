import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        SizedBox,
        Column,
        MainAxisAlignment,
        Icon,
        Icons,
        TextAlign;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;

/// やることリスト: データがまだない
class TodoNoDataAnnotation extends StatelessWidget {
  const TodoNoDataAnnotation({
    required this.i18n,
    required this.color,
    super.key,
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
          Icon(
            Icons.info,
            color: color.base.textOpacity,
            size: 56,
          ),
          SpacerHeight.m,
          TextAnnotation(
            color: color,
            text: i18n.pageTodoNoData,
            size: "M",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
