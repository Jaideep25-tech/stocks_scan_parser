class StockModel {
  int id;
  String name;
  String tag;
  String color;
  List<dynamic> criteria;

  StockModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tag": tag,
        "color": color,
        "criteria": List<dynamic>.from(criteria.map((x) => x.toJson())),
      };
}
