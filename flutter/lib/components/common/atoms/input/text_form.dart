import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// input: textForm
class InputTextForm extends StatelessWidget {
  const InputTextForm({
    super.key,
    required this.color,
    required this.hintText,
    required this.text,
    this.autofocus,
    this.onChanged,
    this.focusNode,
    this.maxLength,
  });

  /// カラーの設定
  final UseColor color;

  /// プレフィックス
  final TextEditingController text;

  /// プレフィックス
  final String hintText;

  /// 自動フォーカス
  final bool? autofocus;

  /// フォーカスノード
  final FocusNode? focusNode;

  /// 文字数
  final int? maxLength;

  /// 変更した
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    /// 変更された
    void onChanged(String t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

    /// inputのスタイル
    InputDecoration decoration(String hintText) {
      return InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(ConstantSizeUI.l1)),
          borderSide: BorderSide(
            color: color.input.inputBorderFocus,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(ConstantSizeUI.l1)),
          borderSide: BorderSide(
            color: color.input.inputBorder,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(ConstantSizeUI.l1)),
          borderSide: BorderSide(
            color: color.input.inputBorderError,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:
              const BorderRadius.all(Radius.circular(ConstantSizeUI.l1)),
          borderSide: BorderSide(
            color: color.input.inputBorderError,
            width: 2.0,
          ),
        ),
        errorStyle: TextStyle(
          color: color.input.inputErrorText,
        ),
        filled: true,
        fillColor: color.input.input,
        hintText: hintText,
        hintStyle: TextStyle(
          color: color.input.inputHintText,
        ),
        contentPadding: const EdgeInsets.all(ConstantSizeUI.l3),
      );
    }

    /// バリデーション
    String? validateForm(String? v) {
      if (maxLength != null && v != null && v.length > maxLength!) {
        return "※文字数が超えています。";
      }
      return null;
    }

    return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: text,
      style: TextStyle(color: color.base.text),
      decoration: decoration(hintText),
      autofocus: autofocus ?? false,
      onChanged: onChanged,
      focusNode: focusNode,
      maxLines: 6,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validateForm,
    );
  }
}
