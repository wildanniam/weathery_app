import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:weathery_app/providers/weather_provider.dart';
import 'package:weathery_app/core/network/api_service.dart';
import 'package:weathery_app/models/weather_model.dart';

import 'weather_provider_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late WeatherProvider weatherProvider;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    weatherProvider = WeatherProvider(apiService: mockApiService);
  });

  group('WeatherProvider Tests', () {
    test('initial state is correct', () {
      expect(weatherProvider.isLoading, false);
      expect(weatherProvider.error, null);
      expect(weatherProvider.weather, null);
    });

    test('fetchWeatherData sets loading state', () async {
      when(mockApiService.getWeatherData()).thenAnswer(
        (_) async => {
          'current_weather': {
            'temperature': 25.5,
            'weathercode': 0,
          },
          'hourly': {
            'time': ['2024-03-20T00:00'],
            'temperature_2m': [25.5],
            'weathercode': [0],
          },
          'daily': {
            'time': ['2024-03-20'],
            'temperature_2m_max': [28.0],
            'temperature_2m_min': [22.0],
            'weathercode': [0],
          },
        },
      );

      final future = weatherProvider.fetchWeatherData();
      expect(weatherProvider.isLoading, true);
      await future;
      expect(weatherProvider.isLoading, false);
    });

    test('fetchWeatherData updates weather data on success', () async {
      final mockData = {
        'current_weather': {
          'temperature': 25.5,
          'weathercode': 0,
        },
        'hourly': {
          'time': ['2024-03-20T00:00'],
          'temperature_2m': [25.5],
          'weathercode': [0],
        },
        'daily': {
          'time': ['2024-03-20'],
          'temperature_2m_max': [28.0],
          'temperature_2m_min': [22.0],
          'weathercode': [0],
        },
      };

      when(mockApiService.getWeatherData()).thenAnswer(
        (_) async => mockData,
      );

      await weatherProvider.fetchWeatherData();
      expect(weatherProvider.weather, isA<WeatherModel>());
      expect(weatherProvider.weather?.temperature, 25.5);
      expect(weatherProvider.weather?.weatherCode, 0);
    });

    test('fetchWeatherData sets error state on failure', () async {
      when(mockApiService.getWeatherData()).thenThrow(Exception('API Error'));

      await weatherProvider.fetchWeatherData();
      expect(weatherProvider.error, isNotNull);
      expect(weatherProvider.weather, null);
    });
  });
}
