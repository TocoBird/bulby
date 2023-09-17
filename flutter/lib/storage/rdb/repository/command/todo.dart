import 'package:sqflite/sqflite.dart' show Database, ConflictAlgorithm;
import 'package:injectable/injectable.dart' show Injectable;
import 'package:gamer_reflection/storage/rdb/model/todo.dart'
    show ModelTodo, tableNameTodo;

/// Interface: RepositoryTodoCommand
abstract class IRepositoryTodoCommand {
  Future<void> insertTodo(
    Database db,
    int reflectionId,
    int reflectionGroupId,
    int todoType,
  );
  Future<void> deleteTodoById(Database db, int reflectionId);
}

/// Repository: やることリスト
@Injectable(as: IRepositoryTodoCommand)
class RepositoryTodoCommand extends IRepositoryTodoCommand {
  /// 追加: やることリスト
  @override
  Future<void> insertTodo(
    Database db,
    int reflectionId,
    int reflectionGroupId,
    int todoType,
  ) async {
    /// 新規登録
    final ModelTodo todo = ModelTodo(
      indexNum: 0,
      reflectionId: reflectionId,
      reflectionGroupId: reflectionGroupId,
      todoType: todoType,
      createdAt: DateTime.now(),
    );
    await db.insert(
      tableNameTodo,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 削除: やることリスト
  @override
  Future<void> deleteTodoById(Database db, int reflectionId) async {
    await db.delete(
      tableNameTodo,
      where: 'reflection_id = ?',
      whereArgs: [reflectionId],
    );
  }
}
