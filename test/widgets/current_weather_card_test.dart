import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:weathery_app/widgets/current_weather_card.dart';
import 'package:weathery_app/models/weather_model.dart';
import 'package:weathery_app/core/theme/app_theme.dart';

void main() {
  late WeatherModel mockWeather;

  setUp(() {
    mockWeather = WeatherModel(
      temperature: 25.5,
      weatherCode: 0,
      hourlyForecasts: [],
      forecasts: [],
    );
  });

  testGoldens('CurrentWeatherCard renders correctly', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(
          body: CurrentWeatherCard(weather: mockWeather),
        ),
      ),
    );

    await expectLater(
      find.byType(CurrentWeatherCard),
      matchesGoldenFile('current_weather_card.png'),
    );
  });

  testGoldens('CurrentWeatherCard renders correctly in dark mode',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.darkTheme,
        home: Scaffold(
          body: CurrentWeatherCard(weather: mockWeather),
        ),
      ),
    );

    await expectLater(
      find.byType(CurrentWeatherCard),
      matchesGoldenFile('current_weather_card_dark.png'),
    );
  });
}
