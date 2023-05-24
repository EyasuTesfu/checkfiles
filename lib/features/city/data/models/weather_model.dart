import '../../domain/entities/weather_entity.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required String date,
    required String maxTempC,
    required String minTempC,
    required String avgTempC,
    required String url,
  }) : super(
            date: date,
            maxTempC: maxTempC,
            minTempC: minTempC,
            avgTempC: avgTempC,
            url: url);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      date: json[0]['date'],
      maxTempC: json[0]['maxtempC'],
      minTempC: json[0]['mintempC'],
      avgTempC: json[0]['avgtempC'],
      url: json[0]['hourly'][0]["weatherIconUrl"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'maxtempC': maxTempC,
      'mintempC': minTempC,
      'avgtempC': avgTempC,
    };
  }
}
