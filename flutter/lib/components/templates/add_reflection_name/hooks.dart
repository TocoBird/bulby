import 'package:flutter/material.dart'
    show TextEditingController, FocusNode, ValueNotifier, GlobalKey, FormState;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useFocusNode;
import 'package:bulby/api/command/controller/reflection_group.dart'
    show RequestReflectionGroup;
import 'package:bulby/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;

class UseReturn {
  const UseReturn({
    required this.isFisrtView,
    required this.formKey,
    required this.textReflectionName,
    required this.textFieldFocusNode,
    required this.onPressedBack,
    required this.onPressedStart,
    required this.onPressedRegister,
  });

  final bool isFisrtView;
  final GlobalKey<FormState> formKey;
  final TextEditingController textReflectionName;
  final FocusNode textFieldFocusNode;
  final void Function() onPressedBack;
  final void Function() onPressedStart;
  final Future<void> Function() onPressedRegister;
}

/// ロジック
UseReturn useHooks(void Function() changeTabPage) {
  ValueNotifier<bool> isFisrtView = useState<bool>(true);
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

  /// 始めるボタンを押した
  void onPressedStart() {
    isFisrtView.value = false;
  }

  /// 戻るボタンを押した
  void onPressedBack() {
    isFisrtView.value = true;
  }

  return UseReturn(
    isFisrtView: isFisrtView.value,
    formKey: formKey,
    textReflectionName: textReflectionName.value,
    textFieldFocusNode: textFieldFocusNode,
    onPressedBack: onPressedBack,
    onPressedStart: onPressedStart,
    onPressedRegister: onPressedRegister,
  );
}
