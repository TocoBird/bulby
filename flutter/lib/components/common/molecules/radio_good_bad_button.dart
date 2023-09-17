import 'package:flutter/material.dart'
    show StatelessWidget, Widget, BuildContext, Row, Expanded;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/components/common/atoms/button/radio.dart'
    show ButtonRadio;

/// ラジオボタン: 良かったこと悪かったこと
class RadioGoodBadButton extends StatelessWidget {
  const RadioGoodBadButton({
    super.key,
    required this.i18n,
    required this.color,
    required this.groupValue,
    this.heightSize,
    required this.onChangedGood,
    required this.onChangedBad,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String groupValue;

  /// 縦のサイズ
  final double? heightSize;

  /// 良いに変更した
  final void Function(String?) onChangedGood;

  /// 悪いに変更した
  final void Function(String?) onChangedBad;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonRadio(
            color: color,
            groupValue: groupValue,
            value: "good",
            text: i18n.commonRadioGoodBadButtonGood,
            minimumSize: heightSize,
            onPressed: (v) => onChangedGood(v),
          ),
        ),
        SpacerWidth.s,
        Expanded(
          child: ButtonRadio(
            color: color,
            groupValue: groupValue,
            value: "bad",
            text: i18n.commonRadioGoodBadButtonBad,
            minimumSize: heightSize,
            onPressed: (v) => onChangedBad(v),
          ),
        ),
      ],
    );
  }
}
