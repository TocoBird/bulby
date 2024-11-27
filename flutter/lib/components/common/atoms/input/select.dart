import 'package:flutter/material.dart';
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// セレクトアイテム
class SelectItem {
  const SelectItem({
    required this.value,
    required this.text,
  });
  final String value;
  final String text;
}

/// input: select
class InputSelect extends StatelessWidget {
  const InputSelect({
    super.key,
    required this.color,
    required this.value,
    required this.items,
    this.focusNode,
    this.onChanged,
  });

  /// カラーの設定
  final UseColor color;

  /// フォーカスノード
  final FocusNode? focusNode;

  /// 値
  final String? value;

  /// 一覧
  final List<SelectItem> items;

  /// 変更した
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    /// 変更された
    void onChanged(String? t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

    /// decoration
    InputDecoration decoration() {
      return InputDecoration(
        filled: true,
        fillColor: color.input.input,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: color.input.inputBorderFocus,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: color.input.inputBorder,
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: ConstantSizeUI.l4,
        ),
      );
    }

    /// DropdownMenuItem配列に変換
    final List<DropdownMenuItem<String>> menuItems = items
        .map(
          (item) => DropdownMenuItem(
            value: item.value,
            child: BasicText(
              color: color,
              size: "M",
              text: item.text,
              isNoSelect: true,
            ),
          ),
        )
        .toList();

    return DropdownButtonFormField(
      items: menuItems,
      decoration: decoration(),
      style: TextStyle(
        color: color.base.text,
      ),
      dropdownColor: color.input.input,
      value: value,
      focusNode: focusNode,
      onChanged: onChanged,

      /// ポップアップ自体の角丸
      borderRadius: const BorderRadius.all(Radius.circular(4)),
    );
  }
}
