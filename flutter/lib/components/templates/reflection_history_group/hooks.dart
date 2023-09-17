import 'package:flutter/material.dart' show BuildContext;

class UseReturn {
  const UseReturn({
    required this.onClickRow,
  });

  final void Function(BuildContext, String, int) onClickRow;
}

/// ロジック: 振り返り履歴グループ一覧
UseReturn useHooks(void Function(BuildContext, String, int) pushDetail) {
  void onClickRow(BuildContext c, String title, int historyGroupId) {
    pushDetail(
      c,
      title,
      historyGroupId,
    );
  }

  return UseReturn(
    onClickRow: onClickRow,
  );
}
