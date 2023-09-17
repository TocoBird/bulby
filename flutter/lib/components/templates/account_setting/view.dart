import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        TextEditingController,
        FocusNode,
        ListView,
        Column,
        CrossAxisAlignment,
        GlobalKey,
        FormState;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:bulby/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:bulby/components/common/atoms/box.dart' show Box;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/button/delete.dart'
    show ButtonDelete;
import 'package:bulby/components/common/molecules/select_language/widget.dart'
    show SelectLanguage;
// import 'package:bulby/components/common/molecules/select_color_mode/widget.dart'
//     show SelectColorMode;
import 'package:bulby/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:bulby/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:bulby/components/templates/account_setting/parts/new_reflection_name.dart'
    show NewReflectionName;
import 'package:bulby/components/templates/account_setting/parts/edit_reflection_name.dart'
    show EditReflectionName;
import 'package:bulby/components/templates/account_setting/parts/button_links.dart'
    show ButtonLinks, ButtonLinksParam;
import 'package:bulby/modules/const/app_info.dart' show ConstantAppInfo;
import 'package:bulby/modules/type/locale.dart' show LocaleCode;

/// アカウント設定
Widget view(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  void Function(LocaleCode) changeLocale,
  List<DomainReflectionGroup> reflectionGroups,
  void Function() onPressedEdit,
  void Function(BuildContext context) onPressedDelete,
  void Function(BuildContext context) onPressedNewName,
  void Function(String?) onChangeReflectionGroup,
  TextEditingController textReflectionName,
  FocusNode textReflectionNameFocusNode,
  TextEditingController textReflectionNewName,
  FocusNode textReflectionNewNameFocusNode,
  GlobalKey<FormState> formKeyNewName,
  GlobalKey<FormState> formKeyEditName,
) {
  final i18n = AppLocalizations.of(context)!;
  const questionnaireLink = "https://flutter.dev";
  const termsOfServiceLink = "https://flutter.dev";
  const privacyPolicyLink = "https://flutter.dev";

  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,

      // 振り返りグループの選択欄
      SelectReflectionGroup(
        color: color,
        reflectionGroups: reflectionGroups,
        onChanged: onChangeReflectionGroup,
      ),

      SpacerHeight.m,

      // 振り返り名の編集
      EditReflectionName(
        i18n: i18n,
        color: color,
        textReflectionName: textReflectionName,
        textReflectionNameFocusNode: textReflectionNameFocusNode,
        onPressedEdit: onPressedEdit,
        formKey: formKeyEditName,
      ),

      SpacerHeight.m,

      // 新規振り返り名の追加
      NewReflectionName(
        i18n: i18n,
        color: color,
        textReflectionNewName: textReflectionNewName,
        textReflectionNewNameFocusNode: textReflectionNewNameFocusNode,
        onPressedNewName: onPressedNewName,
        formKey: formKeyNewName,
      ),

      // SpacerHeight.m,
      // Box(
      //   color: color,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       BasicText(
      //         color: color,
      //         text: i18n.accountPageChangeColorMode,
      //         size: "M",
      //       ),
      //       SpacerHeight.m,
      //       SelectColorMode(
      //         i18n: i18n,
      //         color: color,
      //       ),
      //     ],
      //   ),
      // ),

      SpacerHeight.m,

      // 言語変更欄
      Box(
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
              color: color,
              text: i18n.accountPageChangeLanguage,
              size: "M",
            ),
            SpacerHeight.m,
            SelectLanguage(
              color: color,
              changeLocale: changeLocale,
            ),
          ],
        ),
      ),

      SpacerHeight.m,

      // 選択中の振り返りの削除
      Box(
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
              color: color,
              text: i18n.accountPageDeleteReflection,
              size: "M",
            ),
            SpacerHeight.xs,
            TextAnnotation(
              color: color,
              text: i18n.accountPageDeleteReflectionDetail,
              size: "S",
            ),
            SpacerHeight.m,
            ButtonDelete(
              color: color,
              text: i18n.accountPageDeleteButton,
              onPressed: () => onPressedDelete(context),
            ),
          ],
        ),
      ),

      SpacerHeight.m,

      // 外部リンク欄
      ButtonLinks(
        color: color,
        params: [
          if (i18n.localeName == 'ja')
            ButtonLinksParam(
              text: i18n.accountPageQuestionnaire,
              link: questionnaireLink,
            ),
          ButtonLinksParam(
            text: i18n.accountPageTermsOfService,
            link: termsOfServiceLink,
          ),
          ButtonLinksParam(
            text: i18n.accountPagePrivacyPolicy,
            link: privacyPolicyLink,
          ),
        ],
      ),

      SpacerHeight.m,

      // アプリ情報欄
      Box(
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
              color: color,
              text: i18n.accountPageAppInfo,
              size: "M",
            ),
            SpacerHeight.m,
            BasicText(
              color: color,
              text: 'Version ${ConstantAppInfo.version}',
              size: "M",
            ),
          ],
        ),
      ),

      SpacerHeight.m,
    ],
  );

  return BaseLayoutPadding(
    i18n: i18n,
    color: color,
    title: i18n.accountPageTitle,
    onTap: () => {
      textReflectionNameFocusNode.unfocus(),
      textReflectionNewNameFocusNode.unfocus(),
    },
    isBackGround: true,
    child: cloumn,
  );
}
