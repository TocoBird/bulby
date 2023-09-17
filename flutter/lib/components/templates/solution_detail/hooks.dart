import 'package:flutter/material.dart'
    show
        FocusNode,
        TextEditingController,
        ValueNotifier,
        GlobalKey,
        FormState,
        BuildContext;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useFocusNode, useEffect;
import 'package:bulby/api/command/controller/reflection.dart'
    show RequestReflection;
import 'package:bulby/components/common/atoms/toast/hooks.dart' show useToast;
import 'package:bulby/api/command/controller/todo.dart' show RequestTodo;
import 'package:bulby/components/templates/solution_detail/domain/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:bulby/modules/type/reflection.dart' show ReflectionType;
import 'package:bulby/components/templates/solution_detail/parts/modal/check_done.dart'
    show showModalDone;
import 'package:bulby/components/templates/solution_detail/parts/modal/add_todo.dart'
    show showModalAddTodo;

class UseReturn {
  const UseReturn({
    required this.todoExist,
    required this.titleFocusNode,
    required this.detailFocusNode,
    required this.isEditMode,
    required this.toggleEditMode,
    required this.titleController,
    required this.detailController,
    required this.formKey,
    required this.groupValue,
    required this.onPressedEditDone,
    required this.onPressedDone,
    required this.onPressedCancel,
    required this.onChangedGood,
    required this.onChangedBad,
    required this.onPressedToggleTodo,
  });

  final bool todoExist;
  final FocusNode titleFocusNode;
  final FocusNode detailFocusNode;
  final bool isEditMode;
  final void Function() toggleEditMode;
  final TextEditingController titleController;
  final TextEditingController detailController;
  final GlobalKey<FormState> formKey;
  final String groupValue;
  final void Function() onPressedEditDone;
  final void Function(BuildContext) onPressedDone;
  final void Function() onPressedCancel;
  final Function(String?) onChangedGood;
  final Function(String?) onChangedBad;
  final Function() onPressedToggleTodo;
}

/// ロジック: タスク詳細ページ
UseReturn useHooks(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  int reflectionId,
  int reflectionGroupId,
  int todoCount,
  DomainSolutionDetailReflection? reflection,
  Future<void> Function() updateReflection,
  bool? todoExistDB,
) {
  final ValueNotifier<bool> isEditMode = useState<bool>(false);
  final FocusNode titleFocusNode = useFocusNode();
  final FocusNode detailFocusNode = useFocusNode();
  final ValueNotifier<TextEditingController> titleController =
      useState<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> detailController =
      useState<TextEditingController>(TextEditingController());
  final ValueNotifier<bool> todoExist = useState<bool>(false);
  final ValueNotifier<int> todoAddCount = useState<int>(0);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<String> groupValue = useState<String>("");
  final toast = useToast(context, color);

  /// 編集モード切り替え
  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;
  }

  useEffect(() {
    if (reflection == null) return;

    titleController.value.text = reflection.text;
    detailController.value.text = reflection.detail;
    final bool isGood = reflection.reflectionType == ReflectionType.good;
    groupValue.value = isGood ? "good" : "bad";

    return;
  }, [reflection]);

  /// やることの反映
  useEffect(() {
    if (todoExistDB == null) return;

    todoExist.value = todoExistDB;
    return;
  }, [todoExistDB]);

  /// タスク完了ボタンを押した
  void onPressedDone(BuildContext context) async {
    showModalDone(
      i18n,
      color,
      context,
      () async => await RequestReflection().deleteReflection(reflectionId),
    );
  }

  /// キャンセルボタンを押した
  void onPressedCancel() async {
    isEditMode.value = false;
    if (reflection == null) return;

    titleController.value.text = reflection.text;
    detailController.value.text = reflection.detail;
    final bool isGood = reflection.reflectionType == ReflectionType.good;
    groupValue.value = isGood ? "good" : "bad";
  }

  /// 編集完了ボタンを押した
  void onPressedEditDone() async {
    if (!formKey.currentState!.validate()) return;
    if (titleController.value.text == "") return;

    await RequestReflection().updateReflection(
      reflectionId,
      titleController.value.text,
      detailController.value.text.trim(),
      groupValue.value == "good" ? ReflectionType.good : ReflectionType.bad,
    );

    toggleEditMode();
    updateReflection();
  }

  /// やることに追加ボタンを押した
  /// トグル形式
  Future<void> onPressedToggleTodo() async {
    if (todoExist.value) {
      // すでにあれば削除
      await RequestTodo().deleteTodo(reflectionId);

      // 追加数を1減らす
      todoAddCount.value--;
      // 通知
      toast.showNotification(
        i18n.solutionDetailPageHooksAlertRemoveTodo,
        2500,
      );
      // 表示を切り替える
      todoExist.value = !todoExist.value;
    } else {
      // 詳細が空の場合
      if (detailController.value.text.isEmpty) {
        final bool isGood = reflection!.reflectionType == ReflectionType.good;
        final String text = isGood
            ? i18n.solutionDetailPageHooksAlertAddGood
            : i18n.solutionDetailPageHooksAlertAddBad;
        toast.showAlert(text, 2500);
        return;
      }

      // やることは15件までしかできない
      // 試合と練習それぞれに対してUXとしての制限
      const max = 15;
      if ((todoCount + todoAddCount.value) >= max) {
        toast.showAlert(
          i18n.solutionDetailPageHooksAddTodoValidate,
          2500,
        );
        return;
      }

      // なければ新規追加
      showModalAddTodo(
        i18n,
        color,
        context,
        (bool isGame) async {
          final int todoType = isGame ? 1 : 2;
          await RequestTodo().insertTodo(
            reflectionId,
            reflectionGroupId,
            todoType,
          );
          // 通知
          toast.showNotification(
            i18n.solutionDetailPageHooksAlertAddTodo,
            2500,
          );
          // 追加数を1増やす
          todoAddCount.value++;
          // 表示を切り替える
          todoExist.value = !todoExist.value;
        },
      );
    }
  }

  /// 良いを押した
  void onChangedGood(String? t) {
    groupValue.value = t ?? "";
  }

  /// 悪いを押した
  void onChangedBad(String? t) {
    groupValue.value = t ?? "";
  }

  return UseReturn(
    todoExist: todoExist.value,
    onPressedDone: onPressedDone,
    onPressedEditDone: onPressedEditDone,
    toggleEditMode: toggleEditMode,
    onPressedCancel: onPressedCancel,
    titleFocusNode: titleFocusNode,
    detailFocusNode: detailFocusNode,
    isEditMode: isEditMode.value,
    titleController: titleController.value,
    detailController: detailController.value,
    formKey: formKey,
    groupValue: groupValue.value,
    onChangedGood: onChangedGood,
    onChangedBad: onChangedBad,
    onPressedToggleTodo: onPressedToggleTodo,
  );
}
