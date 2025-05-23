class WeatherModel {
  final double temperature;
  final int weatherCode;
  final List<HourlyForecast> hourlyForecasts;
  final List<DailyForecast> forecasts;

  WeatherModel({
    required this.temperature,
    required this.weatherCode,
    required this.hourlyForecasts,
    required this.forecasts,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current_weather'];
    final hourly = json['hourly'];
    final daily = json['daily'];

    List<HourlyForecast> hourlyForecasts = [];
    for (int i = 0; i < hourly['time'].length; i++) {
      hourlyForecasts.add(HourlyForecast(
        time: DateTime.parse(hourly['time'][i]),
        temperature: hourly['temperature_2m'][i].toDouble(),
        weatherCode: hourly['weathercode'][i],
      ));
    }

    List<DailyForecast> dailyForecasts = [];
    for (int i = 0; i < daily['time'].length; i++) {
      dailyForecasts.add(DailyForecast(
        date: DateTime.parse(daily['time'][i]),
        maxTemperature: daily['temperature_2m_max'][i].toDouble(),
        minTemperature: daily['temperature_2m_min'][i].toDouble(),
        weatherCode: daily['weathercode'][i],
      ));
    }

    return WeatherModel(
      temperature: current['temperature'].toDouble(),
      weatherCode: current['weathercode'],
      hourlyForecasts: hourlyForecasts,
      forecasts: dailyForecasts,
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

class DailyForecast {
  final DateTime date;
  final double maxTemperature;
  final double minTemperature;
  final int weatherCode;

  DailyForecast({
    required this.date,
    required this.maxTemperature,
    required this.minTemperature,
    required this.weatherCode,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: DateTime.parse(json['date']),
      maxTemperature: json['maxTemperature'].toDouble(),
      minTemperature: json['minTemperature'].toDouble(),
      weatherCode: json['weatherCode'],
    );
  }
}
