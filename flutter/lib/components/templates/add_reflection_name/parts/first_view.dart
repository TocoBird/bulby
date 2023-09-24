import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        ListView,
        TextAlign,
        Container,
        Padding,
        EdgeInsets,
        Column,
        CrossAxisAlignment,
        Expanded;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/molecules/select_language/widget.dart'
    show SelectLanguage;
import 'package:bulby/components/common/atoms/box/box_comment.dart'
    show BoxComment;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;
import 'package:bulby/components/common/atoms/button/basic.dart'
    show ButtonBasic;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/icon/icon_logo.dart'
    show IconLogo;
import 'package:bulby/modules/type/locale.dart' show LocaleCode;

/// 最初の画面
class FirstView extends StatelessWidget {
  const FirstView({
    super.key,
    required this.i18n,
    required this.color,
    required this.onPressed,
    required this.changeLocale,
  });

  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// クリックした
  final void Function() onPressed;

  /// 言語変更をクリックした
  final void Function(LocaleCode) changeLocale;

  @override
  Widget build(BuildContext context) {
    // メインコンテンツ
    final content = ListView(
      children: [
        SpacerHeight.xl,
        IconLogo(
          color: color.base.text,
          width: ConstantSizeUI.l11,
          height: ConstantSizeUI.l11,
        ),
        SpacerHeight.s,
        BasicText(
          color: color,
          size: "L",
          text: "Bulby",
          isBold: true,
          textAlign: TextAlign.center,
        ),
        SpacerHeight.xm,
        BoxComment(
          color: color,
          child: BasicText(
            color: color,
            size: "M",
            text: i18n.pageAddReflectionNameStartText,
            textAlign: TextAlign.center,
          ),
        ),
        SpacerHeight.xm,
        ButtonBasic(
          color: color,
          text: i18n.pageAddReflectionNameStartButton,
          onPressed: onPressed,
        ),
      ],
    );

    // 下部のボタン
    final bottomContent = Container(
      color: color.base.content,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ConstantSizeUI.l3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
              color: color,
              text: i18n.pageAddReflectionNameLanguageTitle,
              size: "M",
            ),
            SpacerHeight.s,
            SelectLanguage(
              color: color,
              changeLocale: changeLocale,
            ),
          ],
        ),
      ),
    );

    // 下部のボタンを固定にする
    final contents = Column(
      children: <Widget>[
        Expanded(child: content),
        bottomContent,
      ],
    );

    return contents;
  }
}
