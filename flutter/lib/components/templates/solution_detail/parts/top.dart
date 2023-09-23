import 'package:flutter/material.dart'
    show
        StatelessWidget,
        FocusNode,
        TextEditingController,
        Widget,
        BuildContext,
        Column,
        Row,
        CrossAxisAlignment;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:bulby/components/common/atoms/box/box.dart' show Box;
import 'package:bulby/components/templates/solution_detail/domain/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:bulby/modules/type/reflection.dart' show ReflectionType;
import 'package:bulby/components/common/atoms/text_tag.dart' show TextTag;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:bulby/modules/type/tag_text_color.dart' show TagTextColor;
import 'package:intl/intl.dart' show DateFormat;

/// タスク詳細上部
class SolutionDetailTop extends StatelessWidget {
  const SolutionDetailTop({
    super.key,
    required this.i18n,
    required this.color,
    required this.reflection,
    required this.titleFocusNode,
    required this.detailFocusNode,
    required this.titleController,
    required this.detailController,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 文字
  final DomainSolutionDetailReflection? reflection;

  /// FocusNode title
  final FocusNode titleFocusNode;

  /// FocusNode detail
  final FocusNode detailFocusNode;

  /// EditingController: title
  final TextEditingController titleController;

  /// EditingController: detail
  final TextEditingController detailController;

  @override
  Widget build(BuildContext context) {
    final bool isGood = reflection?.reflectionType == ReflectionType.good;
    final int count = reflection?.count ?? 0;
    final bool detailNotExist = reflection?.detail == "";
    final String reflectionText = reflection?.text ?? "";
    final String reflectionDetail = reflection?.detail ?? "";
    final String countText = i18n.solutionDetailPageTopCountValue(count);
    final String reflectionTypeText = isGood
        ? i18n.solutionDetailPageTopTypeGood
        : i18n.solutionDetailPageTopTypeBad;
    final String detailTitle = isGood
        ? i18n.solutionDetailPageTopDetailGood
        : i18n.solutionDetailPageTopDetailBad;
    final String updateAtText = DateFormat("yyyy.MM.dd")
        .format(reflection?.updatedAt ?? DateTime.now());
    final String reflectionUpdateAtText =
        i18n.solutionDetailPageTopUpdateAt(updateAtText);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Box(
          color: color,
          child: BasicText(
            color: color,
            text: reflectionText,
            size: "M",
          ),
        ),
        SpacerHeight.m,
        Row(
          children: [
            TextTag(
              color: color,
              text: countText,
              colorType: TagTextColor.gray,
            ),
            SpacerWidth.m,
            TextTag(
              color: color,
              text: reflectionTypeText,
              colorType: TagTextColor.gray,
            ),
          ],
        ),
        SpacerHeight.m,
        TextTag(
          color: color,
          text: reflectionUpdateAtText,
          colorType: TagTextColor.gray,
        ),
        SpacerHeight.m,
        BasicText(
          color: color,
          text: detailTitle,
          size: "M",
        ),
        SpacerHeight.m,
        Box(
          color: color,
          child: detailNotExist
              ? TextAnnotation(
                  color: color,
                  text: i18n.solutionDetailPageTopNoData,
                  size: "M",
                )
              : BasicText(
                  color: color,
                  text: reflectionDetail,
                  size: "M",
                ),
        ),
      ],
    );
  }
}
