class ItemModel {
  final int id;
  final String name;
  final int count;

  ItemModel({
    required this.id,
    required this.name,
    required this.count,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      count: json['count'],
    );
  }
}
