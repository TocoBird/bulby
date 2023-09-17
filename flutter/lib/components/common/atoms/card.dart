import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// 削除ボタン付きコンテンツ
class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.color,
    required this.child,
    required this.onPressedRemove,
    required this.onPressed,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final Widget child;

  /// クリックした
  final Function() onPressed;

  /// 削除ボタン
  final Function() onPressedRemove;

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      backgroundColor: color.base.box,
      padding: const EdgeInsets.only(
        top: 20,
        left: ConstantSizeUI.l3,
        bottom: 20,
        right: ConstantSizeUI.l4,
      ),
      minimumSize: const Size.fromHeight(ConstantSizeUI.l7),
      elevation: 1,
      alignment: Alignment.topLeft,
      shadowColor: color.base.boxBorder,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ConstantSizeUI.l1),
        side: BorderSide(
          width: 1.0,
          color: color.base.boxBorder,
        ),
      ),
    );

    return Stack(
      alignment: Alignment.topRight,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: child,
        ),
        Positioned(
          right: ConstantSizeUI.l2,
          top: ConstantSizeUI.l2,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: color.base.iconBackGroundThin,
            child: IconButton(
              iconSize: ConstantSizeUI.l3,
              padding: const EdgeInsets.all(0),
              icon: Icon(
                Icons.close,
                color: color.base.iconDark,
              ),
              onPressed: onPressedRemove,
              splashRadius: 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
