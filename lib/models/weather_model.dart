class WeatherModel {
  final double temperature;
  final int weatherCode;
  final List<HourlyForecast> hourlyForecasts;

  WeatherModel({
    required this.temperature,
    required this.weatherCode,
    required this.hourlyForecasts,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current_weather'];
    final hourly = json['hourly'];

    List<HourlyForecast> forecasts = [];
    for (int i = 0; i < hourly['time'].length; i++) {
      forecasts.add(HourlyForecast(
        time: DateTime.parse(hourly['time'][i]),
        temperature: hourly['temperature_2m'][i].toDouble(),
        weatherCode: hourly['weathercode'][i],
      ));
    }

    return WeatherModel(
      temperature: current['temperature'].toDouble(),
      weatherCode: current['weathercode'],
      hourlyForecasts: forecasts,
    );
  }

  String getWeatherDescription() {
    switch (weatherCode) {
      case 0:
        return 'Cerah';
      case 1:
      case 2:
      case 3:
        return 'Berawan';
      case 45:
      case 48:
        return 'Berkabut';
      case 51:
      case 53:
      case 55:
        return 'Gerimis';
      case 61:
      case 63:
      case 65:
        return 'Hujan';
      case 71:
      case 73:
      case 75:
        return 'Salju';
      case 77:
        return 'Butiran Salju';
      case 80:
      case 81:
      case 82:
        return 'Hujan Lebat';
      case 85:
      case 86:
        return 'Hujan Salju';
      case 95:
        return 'Badai Petir';
      case 96:
      case 99:
        return 'Badai Petir dengan Hujan Es';
      default:
        return 'Tidak Diketahui';
    }
  }
}

class HourlyForecast {
  final DateTime time;
  final double temperature;
  final int weatherCode;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.weatherCode,
  });
}
