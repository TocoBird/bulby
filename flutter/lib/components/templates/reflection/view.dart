import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        ListView,
        Column,
        Row,
        Image,
        Expanded,
        MainAxisAlignment,
        TextAlign,
        CircleAvatar,
        IconButton,
        EdgeInsets,
        Padding,
        SizedBox,
        Icon,
        Icons;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:bulby/components/common/atoms/box/box.dart' show Box;
import 'package:bulby/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:bulby/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:bulby/components/common/atoms/button/basic.dart'
    show ButtonBasic;
import 'package:bulby/components/common/atoms/gauge_bar.dart' show GaugeBar;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

///
Widget view(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  List<DomainReflectionGroup> reflectionGroups,
  String expText,
  String rank,
  String rankImage,
  double gaugePercent,
  Function(BuildContext) onPressedStart,
  Function(BuildContext) onPressedHistory,
  Function(BuildContext) onPressedRankDetail,
  void Function(String?) onChangeReflectionGroup,
) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,
      SelectReflectionGroup(
        color: color,
        reflectionGroups: reflectionGroups,
        onChanged: onChangeReflectionGroup,
      ),
      SpacerHeight.m,
      Row(children: [
        if (rankImage.isNotEmpty)
          Image.asset(
            rankImage,
            width: 48,
            height: 48,
          ),
        SpacerWidth.s,
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BasicText(
                        color: color,
                        text: rank,
                        size: "M",
                        isBold: true,
                        textAlign: TextAlign.center,
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: color.base.iconBackGround,
                        child: IconButton(
                          iconSize: ConstantSizeUI.l3,
                          padding: const EdgeInsets.all(0),
                          icon: Icon(
                            Icons.question_mark,
                            color: color.base.iconDark,
                          ),
                          onPressed: () => onPressedRankDetail(context),
                          splashRadius: 0.1,
                        ),
                      ),
                    ],
                  ),
                  BasicText(
                    color: color,
                    text: expText,
                    size: "S",
                    isBold: true,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SpacerHeight.s,
              GaugeBar(
                color: color,
                percent: gaugePercent,
              ),
            ],
          ),
        )
      ]),
      SpacerHeight.m,
      Box(
        color: color,
        child: Column(
          children: [
            BasicText(
              color: color,
              text: i18n.pageReflectionHowToTitle,
              size: "M",
              isBold: true,
            ),
            SpacerHeight.m,
            BasicText(
              color: color,
              text: i18n.pageReflectionHowToDetail,
              size: "M",
            ),
            SpacerHeight.s,
            TextAnnotation(
              color: color,
              text: i18n.pageReflectionHowToDetailSub,
              size: "XS",
            ),
          ],
        ),
      ),
    ],
  );

  final content = Column(
    children: <Widget>[
      Expanded(child: cloumn),
      Column(
        children: [
          ButtonBasic(
            color: color,
            text: i18n.pageReflectionButtonStart,
            onPressed: () => onPressedStart(context),
          ),
          SpacerHeight.s,
        ],
      ),
    ],
  );

  // 右上のメニュー: 履歴
  final isSizeS = i18n.localeName == 'fr' || i18n.localeName == 'it';
  Padding rightButton = Padding(
    padding: const EdgeInsets.only(
      top: ConstantSizeUI.l2,
      bottom: ConstantSizeUI.l2,
      right: ConstantSizeUI.l2,
    ),
    child: SizedBox(
      width: 88,
      child: ButtonBasic(
        color: color,
        text: i18n.headerMenuRightHistory,
        onPressed: () => onPressedHistory(context),
        isThin: true,
        textSize: isSizeS ? 'S' : 'M',
      ),
    ),
  );

  return BaseLayoutPadding(
    i18n: i18n,
    color: color,
    title: i18n.pageReflectionTitle,
    isBackGround: true,
    rightButton: rightButton,
    canBack: false,
    child: content,
  );
}
