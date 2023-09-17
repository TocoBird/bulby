import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/reflection_history_group.dart'
    show tableNameReflectionHistoryGroup;
import 'package:gamer_reflection/components/templates/reflection_history_group/domain/reflection_history_group.dart'
    show DomainReflectionHistoryGroup;

/// Interface: RepositoryReflectionHistoryGroupQuery
abstract class IRepositoryReflectionHistoryGroupQuery {
  Future<List<DomainReflectionHistoryGroup>> getReflectionHistoryGroups(
    Database db,
    int reflectionGroupId,
  );
}

/// Repository: 振り返り履歴のグループ
@Injectable(as: IRepositoryReflectionHistoryGroupQuery)
class RepositoryReflectionHistoryGroupQuery
    extends IRepositoryReflectionHistoryGroupQuery {
  /// 取得: 振り返り履歴のグループ一覧
  @override
  Future<List<DomainReflectionHistoryGroup>> getReflectionHistoryGroups(
    Database db,
    int reflectionGroupId,
  ) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflectionHistoryGroup,
      columns: ['*'],
      where: '"reflection_group_id" = ?',
      whereArgs: [reflectionGroupId],
      orderBy: "id DESC",
      limit: 10,
    );

    return List.generate(
      res.length,
      (i) {
        return DomainReflectionHistoryGroup(
          id: res[i]['id'] as int,
          date: DateTime.tryParse(res[i]['date'] as String) ?? DateTime.now(),
        );
      },
    );
  }
}
