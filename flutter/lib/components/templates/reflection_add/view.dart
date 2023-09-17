import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        FocusNode,
        GlobalKey,
        ValueNotifier,
        FormState,
        TextEditingController,
        ListView,
        Column,
        Expanded,
        Form,
        AutovalidateMode;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/layouts/base.dart' show BaseLayout;
import 'package:bulby/components/templates/reflection_add/parts/candidate.dart'
    show ReflectionAddCandidate;
import 'package:bulby/components/templates/reflection_add/parts/bottom_contents.dart'
    show BottomContents;
import 'package:bulby/components/templates/reflection_add/domain/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;

///
Widget view(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  List<DomainReflectionAddReflection> reflections,
  String title,
  ValueNotifier<int> badgeNumForListener,
  FocusNode textFieldFocusNode,
  GlobalKey<FormState> formKey,
  TextEditingController textReflection,
  void Function(BuildContext) onPressedAddReflection,
  void Function(String) onPressedAddCandidate,
  void Function(BuildContext) onPressedReflectionDone,
  void Function() onPressedRemoveText,
  void Function(String?) onChangeTextReflection,
  void Function(BuildContext) onClickRightMenu,
  ValueNotifier<List<DomainReflectionAddReflection>> candidatesForListener,
  Future<bool> Function(BuildContext) onWillPop,
) {
  ListView column = ListView(
    children: [
      ReflectionAddCandidate(
        i18n: i18n,
        color: color,
        reflections: reflections,
        onPressCandidate: (String text) => onPressedAddCandidate(text),
        candidatesForListener: candidatesForListener,
      ),
      SpacerHeight.xl,
    ],
  );

  final content = Column(
    children: <Widget>[
      Expanded(child: column),
      BottomContents(
        i18n: i18n,
        color: color,
        textReflection: textReflection,
        textFieldFocusNode: textFieldFocusNode,
        onPressedReflectionDone: onPressedReflectionDone,
        onPressedAddReflection: onPressedAddReflection,
        onPressedRemoveText: onPressedRemoveText,
        onChangeTextReflection: onChangeTextReflection,
      ),
    ],
  );

  return BaseLayout(
    i18n: i18n,
    color: color,
    title: title,
    isBackGround: false,
    onTap: () => textFieldFocusNode.unfocus(),
    badgeNumForListener: badgeNumForListener,
    onClickRightMenu: () => onClickRightMenu(context),
    onWillPop: () => onWillPop(context),
    child: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: content,
    ),
  );
}
