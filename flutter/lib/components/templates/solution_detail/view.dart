import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        FocusNode,
        TextEditingController,
        GlobalKey,
        FormState,
        ListView,
        EdgeInsets,
        Icons,
        Form,
        Padding,
        SizedBox;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/templates/solution_detail/parts/top.dart'
    show SolutionDetailTop;
import 'package:bulby/components/templates/solution_detail/parts/top_edit.dart'
    show SolutionDetailTopEdit;
import 'package:bulby/components/common/atoms/button/done_menu.dart'
    show ButtonDoneMenu;
import 'package:bulby/components/common/atoms/button/icon.dart' show ButtonIcon;
import 'package:bulby/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:bulby/components/layouts/base.dart' show BaseLayout;
import 'package:bulby/components/templates/solution_detail/domain/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

///
Widget view(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  bool todoExist,
  FocusNode titleFocusNode,
  FocusNode detailFocusNode,
  DomainSolutionDetailReflection? reflection,
  bool isEditMode,
  Function toggleEditMode,
  TextEditingController titleController,
  TextEditingController detailController,
  GlobalKey<FormState> formKey,
  final String groupValue,
  void Function() onPressedEditDone,
  void Function(BuildContext) onPressedDone,
  void Function() onPressedCancel,
  final Function(String?) onChangedGood,
  final Function(String?) onChangedBad,
  final Function() onPressedToggleTodo,
) {
  // タスク詳細のView
  ListView content = ListView(
    padding: const EdgeInsets.symmetric(horizontal: ConstantSizeUI.l2),
    children: [
      SpacerHeight.m,
      SolutionDetailTop(
        i18n: i18n,
        color: color,
        reflection: reflection,
        titleFocusNode: titleFocusNode,
        detailFocusNode: detailFocusNode,
        titleController: titleController,
        detailController: detailController,
      ),
      SpacerHeight.xm,
      ButtonIcon(
        color: color,
        icon: Icons.edit,
        text: i18n.solutionDetailPageButtonEdit,
        onPressed: () => toggleEditMode(),
      ),
      SpacerHeight.xm,
      ButtonCancel(
        color: color,
        text: todoExist
            ? i18n.solutionDetailPageButtonRemoveTodo
            : i18n.solutionDetailPageButtonAddTodo,
        onPressed: () async => await onPressedToggleTodo(),
      ),
      SpacerHeight.xm,
    ],
  );

  // 編集可能なView
  ListView editContent = ListView(
    padding: const EdgeInsets.symmetric(horizontal: ConstantSizeUI.l2),
    children: [
      SpacerHeight.m,
      SolutionDetailTopEdit(
        i18n: i18n,
        color: color,
        reflection: reflection,
        titleFocusNode: titleFocusNode,
        detailFocusNode: detailFocusNode,
        groupValue: groupValue,
        titleController: titleController,
        detailController: detailController,
        onChangedGood: onChangedGood,
        onChangedBad: onChangedBad,
      ),
      SpacerHeight.xm,
      ButtonIcon(
        color: color,
        icon: Icons.check_circle,
        text: i18n.solutionDetailPageButtonDone,
        onPressed: () => onPressedEditDone(),
      ),
      SpacerHeight.xm,
      ButtonCancel(
        color: color,
        text: i18n.solutionDetailPageButtonCancel,
        onPressed: () => onPressedCancel(),
      ),
      SpacerHeight.xm,
    ],
  );

  Form form = Form(
    key: formKey,
    child: editContent,
  );

  // 右上のメニュー: 完了
  Padding rightButton = Padding(
    padding: const EdgeInsets.only(
      top: ConstantSizeUI.l2,
      bottom: ConstantSizeUI.l2,
      right: ConstantSizeUI.l2,
    ),
    child: SizedBox(
      width: 80,
      child: ButtonDoneMenu(
        color: color,
        text: i18n.headerMenuRightDone,
        onPressed: () => onPressedDone(context),
      ),
    ),
  );

  return BaseLayout(
    i18n: i18n,
    color: color,
    title: i18n.solutionDetailPageTitle,
    isBackGround: false,
    rightButton: isEditMode ? null : rightButton,
    onTap: () => {
      titleFocusNode.unfocus(),
      detailFocusNode.unfocus(),
    },
    child: isEditMode ? form : content,
  );
}
