class WeatherModel {
  String? clouds;
  double? temp;
  double? temp_max;
  double? temp_min;
  int? sunrise;
  int? sunset;
  String? name;

  WeatherModel({
    this.clouds,
    this.temp,
    this.temp_max,
    this.temp_min,
    this.sunrise,
    this.sunset,
    this.name,
  });
  WeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null && json['weather'].isNotEmpty) {
      clouds = json['weather'][0]['main'];
    }

    name = json['name'];

    if (json['main'] != null) {
      temp = json['main']['temp']?.toDouble();
      temp_max = json['main']['temp_max']?.toDouble();
      temp_min = json['main']['temp_min']?.toDouble();
    }
    sunrise = json['sys']['sunrise'];
    sunset = json['sys']['sunset'];
  }
}
