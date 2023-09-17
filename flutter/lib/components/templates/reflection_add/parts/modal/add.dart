import 'package:flutter/material.dart'
    show
        BuildContext,
        Icons,
        showDialog,
        Navigator,
        StatefulBuilder,
        Widget,
        Column,
        CrossAxisAlignment;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/molecules/radio_good_bad_button.dart'
    show RadioGoodBadButton;
import 'package:bulby/components/common/atoms/button/icon.dart' show ButtonIcon;
import 'package:bulby/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:bulby/components/common/modal/base.dart' show ModalBase;

/// 新規振り返りの場合
Widget reflectionTypeButton(
  AppLocalizations i18n,
  UseColor color,
  String groupValue,
  void Function(String?) onChangedGood,
  void Function(String?) onChangedBad,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BasicText(
        color: color,
        text: i18n.reflectionAddPageModalAddType,
        size: "M",
      ),
      SpacerHeight.s,
      RadioGoodBadButton(
        i18n: i18n,
        color: color,
        groupValue: groupValue,
        onChangedGood: onChangedGood,
        onChangedBad: onChangedBad,
      ),
    ],
  );
}

/// すでに同じ振り返りがある場合
Widget reflectionCount(
  AppLocalizations i18n,
  UseColor color,
  int count,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BasicText(
        color: color,
        text: i18n.reflectionAddPageModalAddCountTitle,
        size: "M",
      ),
      SpacerHeight.s,
      BasicText(
        color: color,
        text: i18n.reflectionAddPageModalAddCountValue(count),
        size: "M",
      ),
    ],
  );
}

///
void showAddModal(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  String title,
  bool candidateExist,
  int count,
  void Function(BuildContext) onPressedAdd,
  void Function() onChangedGood,
  void Function() onChangedBad,
) {
  showDialog(
    barrierColor: color.base.modalBackground,
    context: context,
    builder: (BuildContext contextBuilder) {
      String groupValue = "good";

      return StatefulBuilder(
        builder: (
          BuildContext contextStatefulBuilder,
          void Function(void Function()) setState,
        ) =>
            ModalBase(
          color: color,
          title: title,
          children: [
            // 新規追加
            if (!candidateExist)
              reflectionTypeButton(
                i18n,
                color,
                groupValue,
                (v) => {
                  setState(() {
                    groupValue = v ?? "";
                  }),
                  onChangedGood(),
                },
                (v) => {
                  setState(() {
                    groupValue = v ?? "";
                  }),
                  onChangedBad(),
                },
              ),
            // すでに追加したもの
            if (candidateExist) reflectionCount(i18n, color, count),
            SpacerHeight.m,
            ButtonIcon(
              color: color,
              icon: Icons.add,
              text: i18n.reflectionAddPageModalAddButton,
              onPressed: () => onPressedAdd(contextStatefulBuilder),
            ),
            SpacerHeight.m,
            ButtonCancel(
              color: color,
              text: i18n.reflectionAddPageModalAddButtonCancel,
              onPressed: () => {
                Navigator.pop(contextStatefulBuilder),
              },
            ),
            SpacerHeight.m,
          ],
        ),
      );
    },
  );
}
