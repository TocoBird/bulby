import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Icons,
        Icon,
        Widget,
        BuildContext,
        ElevatedButton,
        Size,
        EdgeInsets,
        RoundedRectangleBorder,
        BorderRadius,
        Radius,
        BorderSide;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:bulby/components/common/atoms/text/basic.dart' show BasicText;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: 削除
class ButtonDelete extends StatelessWidget {
  const ButtonDelete({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final String text;

  /// クリックした
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    /// クリックされた
    void onPressed() {
      this.onPressed();
    }

    final style = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: color.button.delete,
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 2,
      shadowColor: color.button.deleteBorder,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        side: BorderSide(
          width: 2.0,
          color: color.button.deleteBorder,
        ),
      ),
    );

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: style,
      icon: Icon(
        Icons.delete,
        color: color.base.icon,
      ),
      label: BasicText(
        color: color,
        text: text,
        size: "M",
        isNoSelect: true,
      ),
    );
  }
}
