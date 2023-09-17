import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:bulby/storage/rdb/model/game.dart'
    show ModelGame, tableNameGame;

/// Interface: RepositoryGameQuery
abstract class IRepositoryGameQuery {
  Future<ModelGame> getGame(Database db);
}

/// Repository: ゲーミフィケーション
@Injectable(as: IRepositoryGameQuery)
class RepositoryGameQuery extends IRepositoryGameQuery {
  /// 取得: ゲーミフィケーション情報
  @override
  Future<ModelGame> getGame(Database db) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameGame,
      columns: ['*'],
      limit: 1,
    );

    return ModelGame(
      id: res.first['id'] as int,
      exp: res.first['exp'] as int,
      updatedAt: DateTime.tryParse(res.first['updated_at'] as String) ??
          DateTime.now(),
    );
  }
}
