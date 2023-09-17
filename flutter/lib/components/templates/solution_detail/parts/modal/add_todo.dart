import 'package:flutter/material.dart'
    show
        BuildContext,
        showDialog,
        Navigator,
        StatefulBuilder,
        ValueNotifier,
        Widget;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget, useState;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button/basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/common/modal/base.dart'
    show ModalBase;
import 'package:gamer_reflection/components/templates/solution_detail/parts/radio_game_traning_button.dart'
    show RadioGameTraningButton;

/// todoに追加するモーダルを表示
void showModalAddTodo(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  void Function(bool) onPressedAdd,
) {
  showDialog(
    barrierColor: color.base.modalBackground,
    context: context,
    builder: (BuildContext contextBuilder) {
      return StatefulBuilder(
        builder: (BuildContext contextStatefulBuilder, _) => ModalAddTodo(
          i18n: i18n,
          color: color,
          onPressedAdd: onPressedAdd,
        ),
      );
    },
  );
}

/// モーダル: やること追加
class ModalAddTodo extends HookWidget {
  const ModalAddTodo({
    super.key,
    required this.i18n,
    required this.color,
    required this.onPressedAdd,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// 追加を押した
  final void Function(bool) onPressedAdd;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> groupValue = useState<String>("game");

    return ModalBase(
      color: color,
      title: i18n.solutionDetailPageModalAddTodoTitle,
      children: [
        BasicText(
          color: color,
          text: i18n.solutionDetailPageModalAddTodoTitleSub,
          size: "M",
        ),
        SpacerHeight.m,
        RadioGameTraningButton(
          i18n: i18n,
          color: color,
          groupValue: groupValue.value,
          onChangedGame: (String? v) => groupValue.value = "game",
          onChangedTraning: (String? v) => groupValue.value = "traning",
        ),
        SpacerHeight.m,
        ButtonBasic(
          color: color,
          text: i18n.solutionDetailPageModalAddTodoAdd,
          onPressed: () => {
            onPressedAdd(groupValue.value == "game"),
            Navigator.pop(context),
          },
        ),
        SpacerHeight.m,
        ButtonCancel(
          color: color,
          text: i18n.solutionDetailPageModalAddTodoCancel,
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        SpacerHeight.m,
      ],
    );
  }
}
