class Character {
  final String name;
  final String description;
  final Map thumbnail;
  Character({
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = name;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
