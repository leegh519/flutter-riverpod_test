class TodoModel {
  final String id;
  final String description;
  final bool completed;

  TodoModel({
    required this.id,
    required this.description,
    required this.completed,
  });

  TodoModel copyWith({String? id, String? description, bool? completed}) {
    return TodoModel(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}
