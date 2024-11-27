import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        Padding,
        EdgeInsets,
        Scaffold,
        GestureDetector,
        Container,
        BoxDecoration,
        DecorationImage,
        AssetImage,
        BoxFit;
import 'package:bulby/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:bulby/modules/const/size.dart' show ConstantSizeUI;
import 'package:bulby/components/common/molecules/header.dart' show Header;

/// レイアウト: 基本パディング
class BaseLayoutPadding extends HookWidget {
  const BaseLayoutPadding({
    super.key,
    required this.i18n,
    required this.color,
    required this.child,
    required this.title,
    required this.isBackGround,
    required this.canBack,
    this.isNoHeader,
    this.onTap,
    this.rightButton,
  });

  /// 言語
  final AppLocalizations i18n;

  /// カラーの設定
  final UseColor color;

  /// コンテンツ
  final Widget child;

  /// タイトル
  final String title;

  /// 背景あり
  final bool isBackGround;

  /// ヘッダーなし
  final bool? isNoHeader;

  /// 外部を押した
  final void Function()? onTap;

  /// 右上のメニューに表示
  final Widget? rightButton;

  /// 戻るを表示するか
  final bool canBack;

  @override
  Widget build(BuildContext context) {
    final padding = Padding(
      padding: const EdgeInsets.only(
        left: ConstantSizeUI.l3,
        right: ConstantSizeUI.l3,
      ),
      child: child,
    );
    final backGroundBody = Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/backGroundIcons.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: padding,
    );

    //　ヘッダーを表示するか
    bool isShowHeader(bool? isNoShow) {
      if (isNoShow == null) return true;
      return !isNoShow;
    }

    return Scaffold(
      backgroundColor: color.base.content,
      appBar: isShowHeader(isNoHeader)
          ? Header(
              i18n: i18n,
              color: color,
              title: title,
              rightButton: rightButton,
              canBack: canBack,
            )
          : null,
      body: GestureDetector(
        onTap: onTap,
        child: isBackGround ? backGroundBody : padding,
      ),
    );
  }
}
