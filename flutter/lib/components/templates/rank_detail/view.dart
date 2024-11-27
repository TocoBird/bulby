import 'package:flutter/material.dart'
    show Widget, Row, ListView, Image, TextAlign;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:bulby/modules/const/rank/rank_system.dart'
    show ConstantRankSystem;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;

///
Widget view(
  AppLocalizations i18n,
  UseColor color,
  List<ConstantRankSystem> ranks,
) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.xm,
      BasicText(
        color: color,
        text: i18n.pageRankDetailSubTitle,
        size: 'S',
        textAlign: TextAlign.center,
      ),
      SpacerHeight.xm,
      for (var i = 0; i < ranks.length; i++) ...{
        if (i != 0) SpacerHeight.m,
        Row(
          children: [
            Image.asset(
              ranks[i].rankImg,
              width: 48,
              height: 48,
            ),
            SpacerWidth.m,
            BasicText(
              color: color,
              text: ranks[i].prevExp == 0
                  ? ranks[i].rank
                  : "${ranks[i].rank}  ${ranks[i].prevExp}exp",
              size: 'S',
            ),
          ],
        )
      },
      SpacerHeight.m,
    ],
  );

  return BaseLayoutPadding(
    i18n: i18n,
    color: color,
    title: i18n.pageRankDetailTitle,
    isBackGround: false,
    canBack: true,
    child: cloumn,
  );
}
