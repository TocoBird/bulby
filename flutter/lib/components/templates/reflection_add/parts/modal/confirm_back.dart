import 'package:flutter/material.dart'
    show BuildContext, showDialog, Navigator, StatefulBuilder;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/button/basic.dart'
    show ButtonBasic;
import 'package:bulby/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:bulby/components/common/modal/base.dart' show ModalBase;

/// モーダル: 戻るのを確認
void showModalConfirmBack(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
) {
  showDialog(
    barrierColor: color.base.modalBackground,
    context: context,
    builder: (BuildContext contextBuilder) {
      return StatefulBuilder(
        builder: (
          BuildContext contextStatefulBuilder,
          void Function(void Function()) setState,
        ) =>
            ModalBase(
          color: color,
          title: i18n.reflectionAddPageModalConfirmTitle,
          children: [
            ButtonBasic(
              color: color,
              text: i18n.reflectionAddPageModalConfirmBack,
              onPressed: () => {
                Navigator.pop(contextStatefulBuilder),
                Navigator.pop(context),
              },
            ),
            SpacerHeight.m,
            ButtonCancel(
              color: color,
              text: i18n.reflectionAddPageModalConfirmCancel,
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
