import 'package:flutter/material.dart'
    show BuildContext, Icons, showDialog, Navigator;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button/icon.dart'
    show ButtonIcon;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;

///
void showModal(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  String text,
  void Function(BuildContext) onPressed,
) {
  showDialog(
    barrierColor: color.base.modalBackground,
    context: context,
    builder: (contextDialog) {
      return ModalBase(
        color: color,
        title: i18n.accountPageModalNewTitle,
        children: [
          BasicText(
            color: color,
            text: text,
            size: "M",
          ),
          SpacerHeight.m,
          ButtonIcon(
            color: color,
            icon: Icons.add,
            text: i18n.accountPageModalNewButtonAdd,
            onPressed: () => onPressed(contextDialog),
          ),
          SpacerHeight.m,
          ButtonCancel(
            color: color,
            text: i18n.accountPageModalNewCancel,
            onPressed: () => Navigator.pop(contextDialog),
          ),
          SpacerHeight.m,
        ],
      );
    },
  );
}
