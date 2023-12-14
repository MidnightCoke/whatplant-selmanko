class Plant {
  final String name;
  final String season;

  Plant(this.name, this.season);

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      json['name'] as String,
      json['season'] as String,
    );
  }
}
