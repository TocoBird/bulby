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
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection_group(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'localtime'))
)
''');

      // 振り返り
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
      await db.execute('''
CREATE TABLE IF NOT EXISTS reflection_history_group(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  reflection_group_id INTEGER NOT NULL,
  date DATETIME NOT NULL,
  foreign key (reflection_group_id) references reflection_group(id) on delete cascade
)
''');

      // 振り返りの履歴
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
      await db.execute('''
CREATE TABLE IF NOT EXISTS game(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  exp INTEGER NOT NULL,
  updated_at TIMESTAMP DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'localtime'))
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
