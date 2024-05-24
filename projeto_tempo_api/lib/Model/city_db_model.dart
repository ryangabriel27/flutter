class CityDb {
  // Atributos
  int? id;
  final String cityName;
  late final int isFavorite;

  CityDb({
    this.id,
    required this.cityName,
    required this.isFavorite,
  });

  // Métodos
  Map<String, dynamic> toMap() {
    return {
      'cityname': this.cityName,
      'isfavorite': this.isFavorite,
    };
  }

  factory CityDb.fromMap(Map<String, dynamic> map) {
    return CityDb(
      id: map['id'],
      cityName: map['cityname'],
      isFavorite: map['isfavorite'],
    );
  }


}
