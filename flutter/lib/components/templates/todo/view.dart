import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        ListView,
        Column,
        CrossAxisAlignment,
        Expanded,
        Padding,
        EdgeInsets;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:bulby/components/layouts/base.dart' show BaseLayout;
import 'package:bulby/components/templates/todo/parts/no_data_annotation.dart'
    show TodoNoDataAnnotation;
import 'package:bulby/components/templates/todo/parts/bottom_buttons.dart'
    show TodoBottomButtons;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/card.dart' show Card;
import 'package:bulby/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:bulby/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:bulby/components/templates/todo/domain/todo.dart'
    show DomainTodo;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

Widget view(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  bool isSelectedTraining,
  List<DomainTodo>? todos,
  List<DomainReflectionGroup> reflectionGroups,
  void Function(String?) onChangeReflectionGroup,
  void Function(int) onClickRemove,
  void Function() onPressedGame,
  void Function() onPressedTraining,
  void Function(BuildContext, int) pushSolutionDetail,
) {
  // コンテンツ欄
  List<Widget> contents = todos == null
      ? []
      : [
          SpacerHeight.m,

          /// 振り返りグループ選択ボタン
          SelectReflectionGroup(
            color: color,
            reflectionGroups: reflectionGroups,
            onChanged: onChangeReflectionGroup,
          ),

          SpacerHeight.m,

          /// やることリストがない場合
          if (todos.isEmpty)
            TodoNoDataAnnotation(
              i18n: i18n,
              color: color,
            ),

          /// やること一覧
          for (int i = 0; i < todos.length; i++) ...{
            Card(
              color: color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasicText(
                    color: color,
                    text: todos[i].title,
                    size: "M",
                    isBold: true,
                    isNoSelect: true,
                  ),
                  SpacerHeight.xs,
                  TextAnnotation(
                    color: color,
                    text: todos[i].subTitle,
                    size: "XS",
                  ),
                ],
              ),
              onPressed: () => pushSolutionDetail(
                context,
                todos[i].reflectionId,
              ),
              onPressedRemove: () => onClickRemove(todos[i].reflectionId),
            ),
            SpacerHeight.m,
          }
        ];

  ListView column = ListView(
    children: contents,
  );

  final content = Column(
    children: <Widget>[
      // コンテンツ
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ConstantSizeUI.l3,
          ),
          child: column,
        ),
      ),

      // 下部のボタン一覧
      TodoBottomButtons(
        i18n: i18n,
        color: color,
        isSelectedTraining: isSelectedTraining,
        onPressedGame: onPressedGame,
        onPressedTraining: onPressedTraining,
      ),
    ],
  );

  return BaseLayout(
    i18n: i18n,
    color: color,
    title: i18n.pageTodoTitle,
    isBackGround: true,
    canBack: false,
    child: content,
  );
}
