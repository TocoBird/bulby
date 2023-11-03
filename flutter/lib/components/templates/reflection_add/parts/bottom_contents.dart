import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        FocusNode,
        TextEditingController,
        Column,
        CrossAxisAlignment,
        Padding,
        EdgeInsets,
        Container,
        Row,
        Expanded,
        SizedBox,
        SafeArea,
        Builder,
        ValueNotifier;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:bulby/components/common/atoms/input/text/widget.dart'
    show InputText;
import 'package:bulby/components/common/atoms/button/basic.dart'
    show ButtonBasic;
import 'package:bulby/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:bulby/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;
import 'package:bulby/components/templates/reflection_add/parts/button_done.dart'
    show ReflectionButtonDone;

Widget view(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  FocusNode textFieldFocusNode,
  TextEditingController textReflection,
  ValueNotifier<int>? badgeNumForListener,
  void Function(BuildContext) onPressedReflectionDone,
  void Function(BuildContext) onPressedAddReflection,
  void Function() onPressedRemoveText,
  void Function(String?) onChangeTextReflection,
) {
  final isTextSizeS = i18n.localeName == 'ru' ||
      i18n.localeName == 'de' ||
      i18n.localeName == 'it' ||
      i18n.localeName == 'pt';

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SpacerHeight.s,

      // 完了ボタン
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantSizeUI.l2,
        ),
        child: ReflectionButtonDone(
          i18n: i18n,
          color: color,
          badgeNumForListener: badgeNumForListener,
          onPressed: () => onPressedReflectionDone(context),
        ),
      ),

      SpacerHeight.s,

      SafeArea(
        child: Container(
          color: color.base.footer,
          padding: const EdgeInsets.all(ConstantSizeUI.l2),
          child: Row(
            children: [
              // 入力欄
              Expanded(
                child: InputText(
                  i18n: i18n,
                  color: color,
                  autofocus: false,
                  text: textReflection,
                  hintText: i18n.reflectionAddPageBottomHint,
                  focusNode: textFieldFocusNode,
                  maxLength: 74,
                  onChanged: onChangeTextReflection,
                  onPressedRemove: onPressedRemoveText,
                ),
              ),

              SpacerWidth.m,

              // 追加ボタン
              SizedBox(
                width: 80,
                child: ButtonBasic(
                  color: color,
                  text: i18n.reflectionAddPageBottomButtonAdd,
                  textSize: isTextSizeS ? 'S' : 'M',
                  onPressed: () => onPressedAddReflection(context),
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

/// 振り返り名候補一覧
class BottomContents extends HookWidget {
  const BottomContents({
    super.key,
    required this.i18n,
    required this.color,
    required this.textFieldFocusNode,
    required this.textReflection,
    required this.badgeNumForListener,
    required this.onPressedReflectionDone,
    required this.onPressedAddReflection,
    required this.onPressedRemoveText,
    required this.onChangeTextReflection,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  ///
  final FocusNode textFieldFocusNode;

  /// バッジ数
  final ValueNotifier<int>? badgeNumForListener;

  ///
  final TextEditingController textReflection;

  /// 振り返りの終了を押した
  final void Function(BuildContext) onPressedReflectionDone;

  /// 振り返りの追加を押した
  final void Function(BuildContext) onPressedAddReflection;

  /// 振り返りの入力文字を削除
  final void Function() onPressedRemoveText;

  /// 振り返りのinputへの入力
  final void Function(String?) onChangeTextReflection;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return view(
          i18n,
          color,
          context,
          textFieldFocusNode,
          textReflection,
          badgeNumForListener,
          onPressedReflectionDone,
          onPressedAddReflection,
          onPressedRemoveText,
          onChangeTextReflection,
        );
      },
    );
  }
}
