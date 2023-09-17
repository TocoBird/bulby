import 'package:flutter/material.dart'
    show
        FocusNode,
        TextEditingController,
        Column,
        Widget,
        BuildContext,
        CrossAxisAlignment;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/input/text/widget.dart'
    show InputText;
import 'package:bulby/components/common/atoms/input/text_form.dart'
    show InputTextForm;
import 'package:bulby/components/templates/solution_detail/domain/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:bulby/modules/type/reflection.dart' show ReflectionType;
import 'package:bulby/components/common/atoms/text_tag.dart' show TextTag;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/modules/type/tag_text_color.dart' show TagTextColor;
import 'package:bulby/components/common/molecules/radio_good_bad_button.dart'
    show RadioGoodBadButton;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// タスク詳細上部: 編集モード
class SolutionDetailTopEdit extends HookWidget {
  const SolutionDetailTopEdit({
    super.key,
    required this.i18n,
    required this.color,
    required this.reflection,
    required this.titleFocusNode,
    required this.detailFocusNode,
    required this.titleController,
    required this.detailController,
    required this.groupValue,
    required this.onChangedGood,
    required this.onChangedBad,
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

  /// 振り返り種類の良い悪い
  final String groupValue;

  /// 良いを押した
  final Function(String?) onChangedGood;

  /// 悪いを押した
  final Function(String?) onChangedBad;

  @override
  Widget build(BuildContext context) {
    final bool isGood = reflection?.reflectionType == ReflectionType.good;
    final int count = reflection?.count ?? 0;
    final String countText = i18n.solutionDetailPageTopEditCountValue(count);
    final String detailTitle = isGood
        ? i18n.solutionDetailPageTopEditDetailGood
        : i18n.solutionDetailPageTopEditDetailBad;
    final String detailHintText = isGood
        ? i18n.solutionDetailPageTopEditDetailHintGood
        : i18n.solutionDetailPageTopEditDetailHintBad;

    final InputText titleForm = InputText(
      i18n: i18n,
      color: color,
      text: titleController,
      hintText: i18n.solutionDetailPageTopEditTitleHint,
      focusNode: titleFocusNode,
      maxLength: 74,
    );
    final InputTextForm detailForm = InputTextForm(
      color: color,
      text: detailController,
      hintText: detailHintText,
      focusNode: detailFocusNode,
      maxLength: 300,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleForm,
        SpacerHeight.m,
        TextTag(
          color: color,
          text: countText,
          colorType: TagTextColor.gray,
        ),
        SpacerHeight.m,
        RadioGoodBadButton(
          i18n: i18n,
          color: color,
          groupValue: groupValue,
          onChangedGood: onChangedGood,
          onChangedBad: onChangedBad,
          heightSize: ConstantSizeUI.l6,
        ),
        SpacerHeight.m,
        BasicText(
          color: color,
          text: detailTitle,
          size: "M",
        ),
        SpacerHeight.m,
        detailForm,
      ],
    );
  }
}
