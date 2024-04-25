class FullGrow {
  String growName = "";
  String mushroomName = "";
  String stageName = "";
  double minTemp = 0;
  double maxTemp = 0;
  double minHumidity = 0;
  double maxHumidity = 0;
  double fea = 0;

  FullGrow({
    required this.growName,
    required this.mushroomName,
    required this.stageName,
    required this.minTemp,
    required this.maxTemp,
    required this.minHumidity,
    required this.maxHumidity,
    required this.fea,
  });

  factory FullGrow.fromJson(Map<String, dynamic> json) {
    return FullGrow(
      growName: json['growName'] ?? "",
      mushroomName: json['mushroomName'] ?? "",
      stageName: json['stageName'] ?? "",
      minTemp: json['minTemp'] != null ? double.parse(json['minTemp'].toString()) : 0,
      maxTemp: json['maxTemp'] != null ? double.parse(json['maxTemp'].toString()) : 0,
      minHumidity: json['minHumidity'] != null ? double.parse(json['minHumidity'].toString()) : 0,
      maxHumidity: json['maxHumidity'] != null ? double.parse(json['maxHumidity'].toString()) : 0,
      fea: json['fea'] != null ? double.parse(json['fea'].toString()) : 0,
    );
  }
}
