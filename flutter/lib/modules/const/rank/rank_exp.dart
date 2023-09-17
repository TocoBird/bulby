/// ランク
/// 経験値は35exp
/// 3ヶ月に1回1ランク下がる
class ConstantRankExp {
  ConstantRankExp._();

  /// ブロンズ
  /// 初期ランク
  static const int bronze = 0;

  /// シルバー
  /// +3回 1日で到達
  static const int silver = 0 + 100;

  /// ゴールド
  /// +3回 2日で到達
  static const int gold = 100 + 100;

  /// プラチナ3
  /// +4回 3日で到達
  static const int platinum3 = 200 + 130;

  /// プラチナ2
  /// +4回 4日で到達
  static const int platinum2 = 330 + 130;

  /// プラチナ1
  /// +4回 5日で到達
  static const int platinum1 = 460 + 130;

  /// ダイヤ3
  /// +6回 7日で到達
  static const int diamond3 = 590 + 200;

  /// ダイヤ2
  /// +6回 9日で到達
  static const int diamond2 = 790 + 200;

  /// ダイヤ1
  /// +6回 11日で到達
  static const int diamond1 = 990 + 200;
}
