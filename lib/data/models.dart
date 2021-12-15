import 'dart:convert';

class MyStatus {
  final String id;
  final String type;
  final Select select;
  MyStatus({
    required this.id,
    required this.type,
    required this.select,
  });

  MyStatus copyWith({
    String? id,
    String? type,
    Select? select,
  }) {
    return MyStatus(
      id: id ?? this.id,
      type: type ?? this.type,
      select: select ?? this.select,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'select': select.toMap(),
    };
  }

  factory MyStatus.fromMap(Map<String, dynamic> map) {
    return MyStatus(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
      select: Select.fromMap(map['select']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyStatus.fromJson(String source) =>
      MyStatus.fromMap(json.decode(source));
}

class MyType {
  final String id;
  final String type;
  final Select select;
  MyType({
    required this.id,
    required this.type,
    required this.select,
  });

  MyType copyWith({
    String? id,
    String? type,
    Select? select,
  }) {
    return MyType(
      id: id ?? this.id,
      type: type ?? this.type,
      select: select ?? this.select,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'select': select.toMap(),
    };
  }

  factory MyType.fromMap(Map<String, dynamic> map) {
    return MyType(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
      select: Select.fromMap(map['select']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyType.fromJson(String source) => MyType.fromMap(json.decode(source));
}

class Select {
  final String id;
  final String name;
  final String color;
  Select({
    required this.id,
    required this.name,
    required this.color,
  });

  Select copyWith({
    String? id,
    String? name,
    String? color,
  }) {
    return Select(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  factory Select.fromMap(Map<String, dynamic> map) {
    return Select(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      color: map['color'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Select.fromJson(String source) => Select.fromMap(json.decode(source));
}

class Name {
  final List<Title> title;
  Name({
    required this.title,
  });

  Name copyWith({
    List<Title>? title,
  }) {
    return Name(
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title.map((x) => x.toMap()).toList(),
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      title: List<Title>.from(map['title']?.map((x) => Title.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) => Name.fromMap(json.decode(source));
}

class Title {
  final Text text;
  Title({
    required this.text,
  });

  Title copyWith({
    Text? text,
  }) {
    return Title(
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text.toMap(),
    };
  }

  factory Title.fromMap(Map<String, dynamic> map) {
    return Title(
      text: Text.fromMap(map['text']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Title.fromJson(String source) => Title.fromMap(json.decode(source));
}

class Text {
  final String content;
  Text({
    required this.content,
  });

  Text copyWith({
    String? content,
  }) {
    return Text(
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
    };
  }

  factory Text.fromMap(Map<String, dynamic> map) {
    return Text(
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Text.fromJson(String source) => Text.fromMap(json.decode(source));
}

class Children {
  final String object;
  final String type;
  final List<Text> paragraph;
  Children({
    required this.object,
    required this.type,
    required this.paragraph,
  });

  Children copyWith({
    String? object,
    String? type,
    List<Text>? paragraph,
  }) {
    return Children(
      object: object ?? this.object,
      type: type ?? this.type,
      paragraph: paragraph ?? this.paragraph,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'object': object,
      'type': type,
      'paragraph': paragraph.map((x) => x.toMap()).toList(),
    };
  }

  factory Children.fromMap(Map<String, dynamic> map) {
    return Children(
      object: map['object'] ?? '',
      type: map['type'] ?? '',
      paragraph: List<Text>.from(map['paragraph']?.map((x) => Text.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Children.fromJson(String source) =>
      Children.fromMap(json.decode(source));
}
