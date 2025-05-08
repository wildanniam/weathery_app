import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:weathery_app/core/network/api_service.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ApiService apiService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiService = ApiService();
  });

  group('ApiService Tests', () {
    test('getWeatherData returns weather data on success', () async {
      // Mock response data
      final mockResponse = {
        'current_weather': {
          'temperature': 25.5,
          'weathercode': 0,
        },
        'hourly': {
          'time': ['2024-03-20T00:00', '2024-03-20T01:00'],
          'temperature_2m': [25.5, 24.5],
          'weathercode': [0, 1],
        },
        'daily': {
          'time': ['2024-03-20', '2024-03-21'],
          'temperature_2m_max': [28.0, 27.0],
          'temperature_2m_min': [22.0, 21.0],
          'weathercode': [0, 1],
        },
      };

      // Mock HTTP response
      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response(jsonEncode(mockResponse), 200),
      );

      // Test API call
      final result = await apiService.getWeatherData();
      expect(result, isA<Map<String, dynamic>>());
      expect(result['current_weather']['temperature'], 25.5);
      expect(result['current_weather']['weathercode'], 0);
    });

    test('getWeatherData throws exception on error', () async {
      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response('Error', 404),
      );

      expect(
        () => apiService.getWeatherData(),
        throwsException,
      );
    });
  });
}
