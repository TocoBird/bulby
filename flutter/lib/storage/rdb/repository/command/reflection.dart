import 'package:sqflite/sqflite.dart'
    show Database, ConflictAlgorithm, Transaction;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:bulby/storage/rdb/model/reflection.dart'
    show ModelReflection, tableNameReflection;
import 'package:bulby/modules/type/reflection.dart' show ReflectionType;
import 'package:bulby/components/templates/reflection_add/domain/reflection_added.dart'
    show DomainReflectionAdded;

/// Interface: RepositoryReflectionCommand
abstract class IRepositoryReflectionCommand {
  Future<void> insertReflection(
    Transaction txn,
    List<DomainReflectionAdded> reflections,
    int groupId,
  );
  Future<void> updateReflectionById(
    Database db,
    int id,
    String text,
    String detail,
    ReflectionType reflectionType,
  );
  Future<void> deleteReflectionById(Database db, int id);
}

/// Repository: 振り返り
@Injectable(as: IRepositoryReflectionCommand)
class RepositoryReflectionCommand extends IRepositoryReflectionCommand {
  /// 追加: 振り返り トランザクション
  @override
  Future<void> insertReflection(
    Transaction txn,
    List<DomainReflectionAdded> reflections,
    int groupId,
  ) async {
    for (var reflection in reflections) {
      // すでに同じ文言が追加されてるか取得する
      final List<Map<String, Object?>> res = await txn.query(
        tableNameReflection,
        columns: ['id', 'count'],
        where: '"text" = ? and "reflection_group_id" = ?',
        whereArgs: [reflection.text, groupId],
      );

      if (res.isEmpty) {
        /// 新規登録
        final ModelReflection model = ModelReflection(
          reflectionGroupId: groupId,
          reflectionType:
              reflection.reflectionType == ReflectionType.good ? 1 : 2,
          text: reflection.text,
          detail: "",
          count: reflection.count,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        await txn.insert(
          tableNameReflection,
          model.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      } else {
        /// 登録済み
        final int id = res.first['id'] as int;
        final int resCount = res.first['count'] as int;

        final ModelReflection model = ModelReflection(
          reflectionGroupId: groupId,
          reflectionType:
              reflection.reflectionType == ReflectionType.good ? 1 : 2,
          text: "",
          detail: "",
          count: resCount + reflection.count,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final Map<String, Object?> map = {}
          ..addAll(model.toMapCount())
          ..addAll(model.toMapUpdatedAt());

        await txn.update(
          tableNameReflection,
          map,
          where: 'id = ?',
          whereArgs: [id],
        );
      }
    }
  }

  /// 更新: 指定したIDの振り返り
  @override
  Future<void> updateReflectionById(
    Database db,
    int id,
    String text,
    String detail,
    ReflectionType reflectionType,
  ) async {
    // todo
    final model = ModelReflection(
      text: text,
      detail: detail,
      reflectionGroupId: 0,
      reflectionType: reflectionType == ReflectionType.good ? 1 : 2,
      count: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    final Map<String, Object?> map = {}
      ..addAll(model.toMapText())
      ..addAll(model.toMapDetail())
      ..addAll(model.toMapReflectionType());

    await db.update(
      tableNameReflection,
      map,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 削除: 指定したIDの振り返り
  @override
  Future<void> deleteReflectionById(Database db, int reflectionId) async {
    /// 振り返りグループの削除
    /// cascadeなので子レコードも削除される
    /// reflectionテーブル, todoテーブル
    await db.delete(
      tableNameReflection,
      where: 'id = ?',
      whereArgs: [reflectionId],
    );
  }
}
