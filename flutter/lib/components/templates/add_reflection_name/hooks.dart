import 'package:flutter/material.dart'
    show TextEditingController, FocusNode, ValueNotifier, GlobalKey, FormState;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useFocusNode;
import 'package:gamer_reflection/api/command/controller/reflection_group.dart'
    show RequestReflectionGroup;
import 'package:gamer_reflection/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;

class UseReturn {
  const UseReturn({
    required this.formKey,
    required this.textReflectionName,
    required this.textFieldFocusNode,
    required this.onPressedRegister,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController textReflectionName;
  final FocusNode textFieldFocusNode;
  final Future<void> Function() onPressedRegister;
}

/// ロジック
UseReturn useHooks(void Function() changeTabPage) {
  ValueNotifier<TextEditingController> textReflectionName =
      useState<TextEditingController>(TextEditingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode textFieldFocusNode = useFocusNode();

  /// 名前を登録する
  Future<void> onPressedRegister() async {
    if (!formKey.currentState!.validate()) return;

    final String name = textReflectionName.value.text;
    if (name.isEmpty) return;

    // DBに追加
    final int id = await RequestReflectionGroup().addReflectionGroup(name);

    // 選択しているキャッシュに保存
    selectReflectionGroupId.save(id.toString());

    // ページ変更
    changeTabPage();
  }

  return UseReturn(
    formKey: formKey,
    textReflectionName: textReflectionName.value,
    textFieldFocusNode: textFieldFocusNode,
    onPressedRegister: onPressedRegister,
  );
}
