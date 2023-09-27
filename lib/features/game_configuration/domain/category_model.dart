class Category {
  String id;
  String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json["newMap"], name: json["name"]);
}
