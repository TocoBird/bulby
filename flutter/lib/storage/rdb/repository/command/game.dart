import 'package:sqflite/sqflite.dart' show Transaction;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:bulby/storage/rdb/model/game.dart'
    show ModelGame, tableNameGame;

/// Interface: RepositoryGameCommand
abstract class IRepositoryGameCommand {
  Future<void> updateAddExp(
    Transaction txn,
    int exp,
  );
}

/// Repository: 振り返り
@Injectable(as: IRepositoryGameCommand)
class RepositoryGameCommand extends IRepositoryGameCommand {
  /// 更新: 経験値を加算する トランザクション
  @override
  Future<void> updateAddExp(
    Transaction txn,
    int exp,
  ) async {
    // 既存のデータ取得
    final List<Map<String, Object?>> res = await txn.query(
      tableNameGame,
      columns: ['*'],
      orderBy: 'id DESC',
      limit: 1,
    );
    final int resId = res.first['id'] as int;
    final int resExp = res.first['exp'] as int;

    final model = ModelGame(
      exp: resExp + exp,
      updatedAt: DateTime.now(),
    );

    await txn.update(
      tableNameGame,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [resId],
    );
  }
}
