class ToDo {
  final int id;
  final String title;
  final DateTime startTime;
  final String category;
  bool isCompleted;
  bool isExpected;
  bool isOnHold;

  ToDo({
    required this.id,
    required this.title,
    required this.startTime,
    required this.category,
    this.isCompleted = false,
    this.isExpected = false,
    this.isOnHold = false,
  });

  ToDo copyWith({
    int? id,
    String? title,
    DateTime? startTime,
    String? category,
    bool? isCompleted,
    bool? isExpected,
    bool? isOnHold,
  }) {
    return ToDo(
      id: id ?? this.id,
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
      isExpected: isExpected ?? this.isExpected,
      isOnHold: isOnHold ?? this.isOnHold,
    );
  }
}
