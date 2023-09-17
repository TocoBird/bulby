import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        ListView,
        Column,
        Icons,
        TextEditingController,
        FocusNode,
        TextAlign,
        FormState,
        GlobalKey,
        Form,
        Container,
        EdgeInsets,
        Padding,
        Expanded,
        AutovalidateMode,
        CrossAxisAlignment;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/input/text/widget.dart'
    show InputText;
import 'package:bulby/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:bulby/components/common/molecules/select_language/widget.dart'
    show SelectLanguage;
import 'package:bulby/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/button/icon.dart' show ButtonIcon;
import 'package:bulby/components/common/atoms/box.dart' show Box;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/modules/type/locale.dart' show LocaleCode;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

/// 見た目
Widget view(
  BuildContext context,
  UseColor color,
  AppLocalizations i18n,
  GlobalKey<FormState> formKey,
  TextEditingController textReflectionName,
  FocusNode textFieldFocusNode,
  void Function() onPressedRegister,
  void Function(LocaleCode) changeLocale,
) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.xl,
      BasicText(
        color: color,
        size: "M",
        text: i18n.pageAddReflectionNameTitle,
        isBold: true,
        textAlign: TextAlign.center,
      ),
      SpacerHeight.m,
      BasicText(
        color: color,
        size: "M",
        text: i18n.pageAddReflectionNameSubTitle,
        textAlign: TextAlign.center,
      ),
      SpacerHeight.l,
      Box(
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
              color: color,
              size: "M",
              text: i18n.pageAddReflectionNameFormTitle,
              isBold: true,
            ),
            SpacerHeight.s,
            TextAnnotation(
              color: color,
              size: "S",
              text: i18n.pageAddReflectionNameFormAnnotation,
            ),
            SpacerHeight.m,
            InputText(
              i18n: i18n,
              color: color,
              text: textReflectionName,
              hintText: i18n.pageAddReflectionNameFormPlaceHolder,
              focusNode: textFieldFocusNode,
              maxLength: 28,
            ),
            SpacerHeight.m,
            ButtonIcon(
              color: color,
              icon: Icons.add,
              text: i18n.pageAddReflectionNameFormButton,
              onPressed: onPressedRegister,
            ),
          ],
        ),
      ),
    ],
  );

  final form = Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    key: formKey,
    child: cloumn,
  );
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

  final content = Column(
    children: <Widget>[
      Expanded(child: form),
      bottomContent,
    ],
  );

  return BaseLayoutPadding(
    i18n: i18n,
    color: color,
    title: "Bulby",
    isBackGround: true,
    child: content,
  );
}
