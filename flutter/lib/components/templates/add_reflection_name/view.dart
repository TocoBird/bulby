import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        ListView,
        Column,
        Alignment,
        Container,
        EdgeInsets,
        Icons,
        TextEditingController,
        FocusNode,
        TextAlign,
        BoxConstraints,
        IconButton,
        Icon,
        FormState,
        GlobalKey,
        Form,
        AutovalidateMode,
        CrossAxisAlignment;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/input/text/widget.dart'
    show InputText;
import 'package:bulby/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:bulby/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/button/icon.dart' show ButtonIcon;
import 'package:bulby/components/common/atoms/box/box.dart' show Box;
import 'package:bulby/components/common/atoms/box/box_comment.dart'
    show BoxComment;
import 'package:bulby/components/common/atoms/icon/icon_logo.dart'
    show IconLogo;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;
import 'package:bulby/modules/type/locale.dart' show LocaleCode;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/templates/add_reflection_name/parts/first_view.dart'
    show FirstView;

/// 見た目
Widget view(
  BuildContext context,
  UseColor color,
  AppLocalizations i18n,
  bool isFisrtView,
  GlobalKey<FormState> formKey,
  TextEditingController textReflectionName,
  FocusNode textFieldFocusNode,
  void Function() onPressedBack,
  void Function() onPressedStart,
  void Function() onPressedRegister,
  void Function(LocaleCode) changeLocale,
) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.s,
      Container(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          iconSize: ConstantSizeUI.l4,
          padding: EdgeInsets.zero,
          color: color.base.text,
          constraints: const BoxConstraints(),
          onPressed: onPressedBack,
        ),
      ),
      SpacerHeight.s,
      IconLogo(
        color: color.base.text,
        width: ConstantSizeUI.l11,
        height: ConstantSizeUI.l11,
      ),
      SpacerHeight.m,
      BoxComment(
        color: color,
        child: Column(
          children: [
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
          ],
        ),
      ),
      SpacerHeight.xm,
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
          ],
        ),
      ),
      SpacerHeight.m,
      ButtonIcon(
        color: color,
        icon: Icons.add,
        text: i18n.pageAddReflectionNameFormButton,
        onPressed: onPressedRegister,
      ),
    ],
  );

  final form = Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    key: formKey,
    child: cloumn,
  );

  final content = isFisrtView
      ? FirstView(
          i18n: i18n,
          color: color,
          onPressed: onPressedStart,
          changeLocale: changeLocale,
        )
      : form;

  return BaseLayoutPadding(
    i18n: i18n,
    color: color,
    title: "",
    isBackGround: true,
    isNoHeader: true,
    canBack: true,
    child: content,
  );
}
