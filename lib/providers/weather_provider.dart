import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/weather_model.dart';
import '../core/network/api_service.dart';

class WeatherProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  WeatherModel? _weather;
  bool _isLoading = false;
  String? _error;
  Position? _currentPosition;

  WeatherModel? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Position? get currentPosition => _currentPosition;

  Future<void> fetchWeather() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await _apiService.getWeatherData();
      _weather = WeatherModel.fromJson(data);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
