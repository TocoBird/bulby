/// ドメイン: やること
class DomainTodo {
  const DomainTodo({
    required this.reflectionId,
    required this.todoType,
    required this.title,
    required this.subTitle,
  });

  /// 振り返りID
  final int reflectionId;

  /// やることの種類
  final int todoType;

  /// タイトル
  final String title;

  /// サブタイトル
  final String subTitle;
}
