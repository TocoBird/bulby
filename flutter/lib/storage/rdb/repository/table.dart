import 'package:sqflite/sqflite.dart' show Database;

/// DB: テーブルのセットアップ
class TableOpenSetUp {
  /// 開いたときに実行する
  Future<void> setUpTable(Database db) async {
    print("---- Open Setup Table ----");

    // 外部キー有効化
    // デフォルトで無効化されるのでコネクションを開くたびにやる
    await db.execute("PRAGMA foreign_keys=true");
  }
}

/// DB: テーブルのセットアップ
class TableSetUp {
  /// テーブルの作成
  Future<void> createTables(Database db) async {
    try {
      print("---- Setup Table ----");

      // 振り返りグループ
      // id: 振り返りグループID
      // name: グループ名
      // created_at: 追加日
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection_group(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'localtime'))
)
''');

      // 振り返り
      // id: 振り返りID
      // reflection_group_id: 振り返りグループID
      // text: 振り返りのタイトル
      // detail: 振り返りの詳細
      // reflection_type: 種類, 1: Good, 2: Bad
      // count: 回数
      // created_at: 追加日
      // updated_at: 更新日
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  reflection_group_id INTEGER NOT NULL,
  text TEXT NOT NULL,
  detail TEXT NOT NULL DEFAULT "",
  reflection_type INTEGER NOT NULL,
  count INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'localtime')),
  updated_at TIMESTAMP DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'localtime')),
  foreign key (reflection_group_id) references reflection_group(id) on delete cascade
)
''');

      // 振り返りの履歴グループ
      // id: 振り返りの履歴グループID
      // reflection_group_id: 振り返りグループID
      // date: 作成日
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection_history_group(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  reflection_group_id INTEGER NOT NULL,
  date DATETIME NOT NULL,
  foreign key (reflection_group_id) references reflection_group(id) on delete cascade
)
''');

      // 振り返りの履歴
      // id: 振り返りの履歴ID
      // reflection_history_group_id: 振り返りの履歴グループID
      // text: 振り返りのタイトル
      // reflection_type: 種類, 1: Good, 2: Bad
      // count: 回数
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection_history(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  reflection_history_group_id INTEGER NOT NULL,
  text TEXT NOT NULL,
  reflection_type INTEGER NOT NULL,
  count INTEGER NOT NULL,
  foreign key (reflection_history_group_id) references reflection_history_group(id) on delete cascade
)
''');

      // やることリスト
      // id: やることリストID
      // index_num: 順番
      // reflection_id: 振り返りID
      // reflection_group_id: 振り返りグループID
      // todo_type: 種類, 1: 試合, 2: 練習
      // created_at: 追加日
      await db.execute('''
CREATE TABLE IF NOT EXISTS todo(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  index_num INTEGER NOT NULL,
  reflection_id INTEGER NOT NULL,
  reflection_group_id INTEGER NOT NULL,
  todo_type INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'localtime')),
  foreign key (reflection_id) references reflection(id) on delete cascade
)
''');

      // ゲーミフィケーション
      // id: ゲーミフィケーションID
      // exp: 経験値
      // updated_at: 更新日
      await db.execute('''
CREATE TABLE IF NOT EXISTS game(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  exp INTEGER NOT NULL,
  updated_at TIMESTAMP DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'localtime'))
)
''');

      // バッジ
      // id: バッジID
      // created_at: 追加日
      await db.execute('''
CREATE TABLE IF NOT EXISTS badge(
  id INTEGER PRIMARY KEY,
  created_at TIMESTAMP DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'localtime'))
)
''');

      // 振り返りをした日
      // date: 振り返りをした日 20200101
      // count: 回数
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection_added_date(
  date DATETIME NOT NULL,
  count INTEGER NOT NULL,
  UNIQUE(date)
)
''');

      // ゲーミフィケーションの初期値
      await db.execute('INSERT INTO game(exp) values(0)');
    } catch (e) {
      // todo ログなど
      rethrow;
    }
  }
}
