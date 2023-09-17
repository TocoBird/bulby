import 'package:sqflite/sqflite.dart' show Database;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;
import 'package:bulby/storage/kvs/selected_period.dart'
    show selectedTaskPagePeriod;
import 'package:bulby/storage/kvs/selected_reflection_type.dart'
    show selectReflectionType;
import 'package:bulby/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;
import 'package:bulby/storage/kvs/selected_todo_type.dart' show selectTodoType;
import 'package:bulby/storage/kvs/selected_language.dart' show selectLanguage;
import 'package:bulby/storage/kvs/selected_color_mode.dart'
    show selectColorMode;

/// DB: テーブルのデバッグ
class TableDebug {
  /// デバック用: レコードを全て表示
  Future<void> showRecords(Database db) async {
    final List<Map<String, Object?>> todos =
        await db.rawQuery('SELECT * FROM todo');
    final List<Map<String, Object?>> reflections =
        await db.rawQuery('SELECT * FROM reflection');
    final List<Map<String, Object?>> reflectionHistorys =
        await db.rawQuery('SELECT * FROM reflection_history');
    final List<Map<String, Object?>> reflectionHistoryGroups =
        await db.rawQuery('SELECT * FROM reflection_history_group');
    final List<Map<String, Object?>> reflectionGroups =
        await db.rawQuery('SELECT * FROM reflection_group');
    final List<Map<String, Object?>> game =
        await db.rawQuery('SELECT * FROM game');

    print("""

---- Records ----

- Todos
$todos
- Reflections
$reflections
- ReflectionHistorys
$reflectionHistorys
- ReflectionHistoryGroups
$reflectionHistoryGroups
- ReflectionGroups
$reflectionGroups
- Game
$game
""");

    print("""

---- KVS ----

- selected TaskPagePeriod
${await selectedTaskPagePeriod.get()}
- select ReflectionType
${await selectReflectionType.get()}
- select ReflectionGroupId
${await selectReflectionGroupId.get()}
- select TodoType
${await selectTodoType.get()}
- select Language
${await selectLanguage.get()}
- select ColorMode
${await selectColorMode.get()}
""");
  }

  /// デバック用: テーブルの全削除
  Future<void> dropAllTables(Database db) async {
    print("---- Drop Tables Start ----");
    await db.execute("DROP TABLE reflection");
    await db.execute("DROP TABLE reflection_history");
    await db.execute("DROP TABLE reflection_history_group");
    await db.execute("DROP TABLE reflection_group");
    await db.execute("DROP TABLE todo");
    await db.execute("DROP TABLE game");
    // AutoIncrementリセット
    await db.execute("DELETE FROM sqlite_sequence WHERE name='app_db'");

    throw Exception("---- Drop Tables End ----");
  }

  /// デバック用: KVSの全削除
  Future<void> dropKVS(Database db) async {
    print("---- Drop KVS Start ----");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    throw Exception("---- Drop KVS End ----");
  }
}
