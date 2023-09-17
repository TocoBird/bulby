import 'package:flutter/material.dart' show BuildContext, showDialog, Navigator;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button/delete.dart'
    show ButtonDelete;
import 'package:gamer_reflection/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;

///
void showDeleteModal(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  String name,
  void Function(BuildContext) onPressed,
) {
  showDialog(
    barrierColor: color.base.modalBackground,
    context: context,
    builder: (contextDialog) {
      return ModalBase(
        color: color,
        title: i18n.accountPageModalDeleteTitle,
        children: [
          BasicText(
            color: color,
            text: name,
            size: "M",
          ),
          SpacerHeight.xs,
          TextAnnotation(
            color: color,
            text: i18n.accountPageModalDeleteSubTitle,
            size: "S",
          ),
          SpacerHeight.m,
          ButtonDelete(
            color: color,
            text: i18n.accountPageModalDeleteButtonDelete,
            onPressed: () => onPressed(contextDialog),
          ),
          SpacerHeight.m,
          ButtonCancel(
            color: color,
            text: i18n.accountPageModalDeleteCancel,
            onPressed: () => Navigator.pop(contextDialog),
          ),
          SpacerHeight.m,
        ],
      );
    },
  );
}
