class FoodItem {
  final int id;
  final String team;
  final String group;
  final String flagImage;

  FoodItem({
    required this.id,
    required this.team,
    required this.group,
    required this.flagImage,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'],
      team: json['team'],
      group: json['group'],
      flagImage: json['flagImage'],
    );
  }

  // named constructor
  FoodItem.fromJson2(Map<String, dynamic> json)
      : id = json['id'],
        team = json['team'],
        group = json['group'],
        flagImage = json['flagImage'];
}
