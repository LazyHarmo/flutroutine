class Task {
  final String title;
  final String subtitle;
  bool isDone;

  Task({
    this.title='',
    this.subtitle='',
    this.isDone = false
  });

  Task copyWith({
    String? title,
    String? subtitle,
    bool? isDone,
  }) {
    return Task(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isDone: isDone ?? this.isDone,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      subtitle: json['subtitle'],
      isDone: json['isDone']
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'isDone': isDone,
    };
  }

  @override
  String toString() {
    return '''Task: {
    title: $title\n
    subtitle: $subtitle\n
    isDone: $isDone
    }''';
  }
}