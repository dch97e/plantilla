class Artist {
  Artist({
    required this.id,
    required this.name,
    required this.title,
    required this.avatar,
  });

  Artist.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    title = json['title'] ?? '';
    avatar = json['avatar'] ?? '';
  }
  late final int id;
  late final String name;
  late final String title;
  late final String avatar;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    data['avatar'] = avatar;
    return data;
  }
}
