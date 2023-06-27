// ignore_for_file: public_member_api_docs, sort_constructors_first
class Character {
  final String name;
  final String description;
  final Map thumbnail;
  final Map comics;
  final Map series;
  final Map stories;
  final Map events;
  Character({
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = name;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['comics'] = comics;
    data['series'] = series;
    data['stories'] = stories;
    data['events'] = events;
    return data;
  }
}
