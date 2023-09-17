import 'package:sqflite/sqflite.dart' show Database;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/todo.dart'
    show tableNameTodo;
import 'package:gamer_reflection/components/templates/todo/domain/todo.dart'
    show DomainTodo;

/// Interface: RepositoryTodoQuery
abstract class IRepositoryTodoQuery {
  Future<List<DomainTodo>> getTodos(Database db, int groupId);
  Future<int> getTodoCount(Database db, int groupId);
  Future<bool> todoExist(Database db, int reflectionId);
}

/// Repository: やることリスト
@Injectable(as: IRepositoryTodoQuery)
class RepositoryTodoQuery extends IRepositoryTodoQuery {
  /// 取得: やること一覧
  @override
  Future<List<DomainTodo>> getTodos(
    Database db,
    int groupId,
  ) async {
    final List<Map<String, Object?>> res = await db.rawQuery(
      'SELECT * FROM todo as t LEFT JOIN reflection as r ON r.id = t.reflection_id WHERE r.reflection_group_id = ? ORDER BY created_at DESC LIMIT ?',
      [
        groupId,
        40,
      ],
    );

    return List.generate(
      res.length,
      (i) {
        return DomainTodo(
          reflectionId: res[i]['reflection_id'] as int,
          todoType: res[i]['todo_type'] as int,
          title: res[i]['detail'] as String,
          subTitle: res[i]['text'] as String,
        );
      },
    );
  }

  /// 取得: やること総数
  @override
  Future<int> getTodoCount(
    Database db,
    int groupId,
  ) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameTodo,
      where: '"reflection_group_id" = ?',
      whereArgs: [groupId],
      columns: ['COUNT(*) as count'],
      limit: 1,
    );
    return res.first['count'] as int;
  }

  /// 取得: やることに追加されているか
  @override
  Future<bool> todoExist(
    Database db,
    int reflectionId,
  ) async {
    final List<Map<String, Object?>> res = await db.query(
      tableNameTodo,
      where: '"reflection_id" = ?',
      whereArgs: [reflectionId],
      columns: ['id'],
    );

    return res.isNotEmpty;
  }
}
