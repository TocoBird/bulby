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
import 'package:bulby/components/common/atoms/box.dart' show Box;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/button/icon.dart' show ButtonIcon;

Widget view(
  BuildContext context,
  AppLocalizations i18n,
  UseColor color,
  TextEditingController textReflectionNewName,
  FocusNode textReflectionNewNameFocusNode,
  Function(BuildContext context) onPressedNewName,
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
          // 振り返りの追加タイトル
          BasicText(
            color: color,
            text: i18n.accountPageAddReflection,
            size: "M",
          ),

          SpacerHeight.m,

          // 入力欄
          InputText(
            i18n: i18n,
            color: color,
            text: textReflectionNewName,
            hintText: i18n.accountPageAddReflectionPlaceHolder,
            focusNode: textReflectionNewNameFocusNode,
            maxLength: 28,
          ),

          SpacerHeight.m,

          // アイコン付きボタン
          ButtonIcon(
            color: color,
            icon: Icons.add,
            text: i18n.accountPageAddReflectionButton,
            onPressed: () => onPressedNewName(context),
          )
        ],
      ),
    ),
  );
}

/// 振り返り名の追加
class NewReflectionName extends StatelessWidget {
  const NewReflectionName({
    super.key,
    required this.i18n,
    required this.color,
    required this.textReflectionNewNameFocusNode,
    required this.textReflectionNewName,
    required this.onPressedNewName,
    required this.formKey,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  ///
  final FocusNode textReflectionNewNameFocusNode;

  ///
  final TextEditingController textReflectionNewName;

  /// 新規追加を押した
  final Function(BuildContext context) onPressedNewName;

  ///
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return view(
      context,
      i18n,
      color,
      textReflectionNewName,
      textReflectionNewNameFocusNode,
      onPressedNewName,
      formKey,
    );
  }
}
