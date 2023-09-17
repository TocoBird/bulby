import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:bulby/storage/rdb/model/reflection.dart'
    show ModelReflection, tableNameReflection;

/// Interface: RepositoryReflectionQuery
abstract class IRepositoryReflectionQuery {
  Future<List<ModelReflection>> getReflections(Database db, int groupId);
  Future<int> getReflectionCount(Database db, int groupId);
  Future<ModelReflection> getReflectionById(Database db, int id);
}

/// Repository: 振り返り
@Injectable(as: IRepositoryReflectionQuery)
class RepositoryReflectionQuery extends IRepositoryReflectionQuery {
  /// 取得: 振り返り一覧
  @override
  Future<List<ModelReflection>> getReflections(
    Database db,
    int groupId,
  ) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflection,
      where: '"reflection_group_id" = ?',
      whereArgs: [groupId],
      columns: ['*'],
      limit: 400,
    );

    return List.generate(
      res.length,
      (i) {
        return ModelReflection(
          id: res[i]['id'] as int,
          reflectionGroupId: res[i]['reflection_group_id'] as int,
          reflectionType: res[i]['reflection_type'] as int,
          text: res[i]['text'] as String,
          detail: res[i]['detail'] as String,
          count: res[i]['count'] as int,
          createdAt: DateTime.tryParse(res[i]['created_at'] as String) ??
              DateTime.now(),
          updatedAt: DateTime.tryParse(res[i]['updated_at'] as String) ??
              DateTime.now(),
        );
      },
    );
  }

  /// 取得: 振り返り総数
  @override
  Future<int> getReflectionCount(
    Database db,
    int groupId,
  ) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflection,
      where: '"reflection_group_id" = ?',
      whereArgs: [groupId],
      columns: ['COUNT(*) as count'],
      limit: 1,
    );
    return res.first['count'] as int;
  }

  /// 取得: 指定したIDの振り返り
  @override
  Future<ModelReflection> getReflectionById(
    Database db,
    int id,
  ) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflection,
      columns: ['*'],
      where: '"id" = ?',
      whereArgs: [id],
    );

    return ModelReflection(
      id: res.first['id'] as int,
      reflectionGroupId: res.first['reflection_group_id'] as int,
      reflectionType: res.first['reflection_type'] as int,
      text: res.first['text'] as String,
      detail: res.first['detail'] as String,
      count: res.first['count'] as int,
      createdAt: DateTime.tryParse(res.first['created_at'] as String) ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(res.first['updated_at'] as String) ??
          DateTime.now(),
    );
  }
}
