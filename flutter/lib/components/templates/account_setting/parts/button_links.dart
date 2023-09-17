import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        BoxDecoration,
        Border,
        BorderRadius,
        Container,
        Column,
        ElevatedButton,
        Size,
        EdgeInsets,
        Row,
        Expanded,
        Icon,
        Icons;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/components/common/atoms/bar.dart' show Bar;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:url_launcher/url_launcher.dart' show canLaunchUrl, launchUrl;

/// ボタンの設定値
class ButtonLinksParam {
  const ButtonLinksParam({
    required this.text,
    required this.link,
  });

  final String text;
  final String link;
}

/// ボタン: リンク
class ButtonLinks extends StatelessWidget {
  const ButtonLinks({
    super.key,
    required this.params,
    required this.color,
  });

  /// カラーの設定
  final UseColor color;

  /// 文字
  final List<ButtonLinksParam> params;

  @override
  Widget build(BuildContext context) {
    // クリックした
    onPressed(String url) async {
      final Uri uri = Uri.parse(url);
      if (!await canLaunchUrl(uri)) return;
      if (!await launchUrl(uri)) throw Exception('Could not launch $uri');
    }

    // 背景色の設定
    final decoration = BoxDecoration(
      color: color.base.box,
      border: Border.all(color: color.base.boxBorder),
      borderRadius: BorderRadius.circular(ConstantSizeUI.l1),
    );

    return Container(
      decoration: decoration,
      child: Column(
        children: [
          for (var i = 0; i < params.length; i++) ...{
            // 線
            if (i != 0) Bar(color: color.button.taskListBorder),

            // ボタン
            ElevatedButton(
              onPressed: () async => await onPressed(params[i].link),
              style: ElevatedButton.styleFrom(
                backgroundColor: color.base.box,
                minimumSize: const Size.fromHeight(ConstantSizeUI.l10),
                padding: const EdgeInsets.only(
                  left: ConstantSizeUI.l3,
                  right: 0,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: BasicText(
                      color: color,
                      text: params[i].text,
                      size: "M",
                      isNoSelect: true,
                    ),
                  ),
                  SpacerWidth.s,
                  Icon(
                    Icons.arrow_right,
                    color: color.base.taskListArrow,
                    size: 40.0,
                  ),
                ],
              ),
            ),
          }
        ],
      ),
    );
  }
}
