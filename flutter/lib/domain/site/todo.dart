/// ドメイン: やることID
class DomainTodoId {
  const DomainTodoId({required this.id});
  final int id;
}

/// ドメイン: 振り返りID
class DomainTodoReflectionId {
  const DomainTodoReflectionId({required this.reflectionId});
  final int reflectionId;
}

/// ドメイン: 振り返り日付
class DomainTodoCreatedAt {
  const DomainTodoCreatedAt({required this.createdAt});
  final DateTime createdAt;
}
