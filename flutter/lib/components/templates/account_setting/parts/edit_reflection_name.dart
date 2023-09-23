import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        TextEditingController,
        FocusNode,
        Column,
        CrossAxisAlignment,
        BuildContext,
        Icons,
        Form,
        GlobalKey,
        FormState,
        AutovalidateMode;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/input/text/widget.dart'
    show InputText;
import 'package:bulby/components/common/atoms/box/box.dart' show Box;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/button/icon.dart' show ButtonIcon;

Widget view(
  AppLocalizations i18n,
  UseColor color,
  TextEditingController textReflectionName,
  FocusNode textReflectionNameFocusNode,
  void Function() onPressedEdit,
  GlobalKey<FormState> formKey,
) {
  return Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    key: formKey,
    child: Box(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 振り返り名の変更タイトル
          BasicText(
            color: color,
            text: i18n.accountPageChangeReflectionName,
            size: "M",
          ),

          SpacerHeight.m,

          // 入力欄
          InputText(
            i18n: i18n,
            color: color,
            text: textReflectionName,
            hintText: i18n.accountPageChangeReflectionNamePlaceHolder,
            focusNode: textReflectionNameFocusNode,
            maxLength: 28,
          ),

          SpacerHeight.m,

          // アイコン付きボタン
          ButtonIcon(
            color: color,
            icon: Icons.edit,
            text: i18n.accountPageChangeReflectionNameButton,
            onPressed: () => onPressedEdit(),
          )
        ],
      ),
    ),
  );
}

/// 振り返り名変更
class EditReflectionName extends StatelessWidget {
  const EditReflectionName({
    super.key,
    required this.i18n,
    required this.color,
    required this.textReflectionNameFocusNode,
    required this.textReflectionName,
    required this.onPressedEdit,
    required this.formKey,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  ///
  final FocusNode textReflectionNameFocusNode;

  ///
  final TextEditingController textReflectionName;

  /// 編集を押した
  final Function() onPressedEdit;

  ///
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return view(
      i18n,
      color,
      textReflectionName,
      textReflectionNameFocusNode,
      onPressedEdit,
      formKey,
    );
  }
}
