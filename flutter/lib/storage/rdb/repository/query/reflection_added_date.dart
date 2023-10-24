import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:bulby/storage/rdb/model/reflection_added_date.dart'
    show tableNameReflectionAddedDate;
import 'package:bulby/components/templates/reflection/domain/reflection_added_date.dart'
    show DomainReflectionAddedDate;

/// Interface: IRepositoryReflectionAddedDateQuery
abstract class IRepositoryReflectionAddedDateQuery {
  Future<List<DomainReflectionAddedDate>> getReflectionAddedDates(
    Database db,
  );
}

/// Repository: 振り返りを追加した日
@Injectable(as: IRepositoryReflectionAddedDateQuery)
class RepositoryReflectionAddedDateQuery
    extends IRepositoryReflectionAddedDateQuery {
  /// 取得: 振り返り履歴のグループ一覧
  @override
  Future<List<DomainReflectionAddedDate>> getReflectionAddedDates(
    Database db,
  ) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameReflectionAddedDate,
      columns: ['*'],
      orderBy: "date DESC",
      limit: 30,
    );

    return List.generate(
      res.length,
      (i) {
        return DomainReflectionAddedDate(
          count: res[i]['count'] as int,
          date: DateTime.tryParse(res[i]['date'] as String) ?? DateTime.now(),
        );
      },
    );
  }
}
