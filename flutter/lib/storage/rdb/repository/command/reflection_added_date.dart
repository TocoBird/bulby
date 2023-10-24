import 'package:sqflite/sqflite.dart' show Database, ConflictAlgorithm;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:bulby/storage/rdb/model/reflection_added_date.dart'
    show ModelReflectionAddedDate, tableNameReflectionAddedDate;
import 'package:intl/intl.dart' show DateFormat;

/// Interface: IReflectionAddedDateCommand
abstract class IReflectionAddedDateCommand {
  Future<void> insertReflectionAddedDate(Database db);
}

/// Repository: 振り返りした日
@Injectable(as: IReflectionAddedDateCommand)
class RepositoryReflectionAddedDateCommand extends IReflectionAddedDateCommand {
  /// 追加: 振り返りした日
  @override
  Future<void> insertReflectionAddedDate(Database db) async {
    DateFormat format = DateFormat('yyyy-MM-dd');
    String date = format.format(DateTime.now());

    // すでに同じ日付が追加されてるか取得する
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflectionAddedDate,
      columns: ['*'],
      where: '"date" = ?',
      whereArgs: [date],
      limit: 1,
    );

    if (res.isEmpty) {
      // まだ登録されてない
      /// 新規登録
      final ModelReflectionAddedDate reflectionAddedDate =
          ModelReflectionAddedDate(
        count: 1,
        date: DateTime.now(),
      );

      await db.insert(
        tableNameReflectionAddedDate,
        reflectionAddedDate.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
