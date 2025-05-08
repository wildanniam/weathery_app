import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/location_helper.dart';

class ApiService {
  static const String baseUrl = 'https://api.open-meteo.com/v1';

  Future<Map<String, dynamic>> getWeatherData() async {
    try {
      // Request permission terlebih dahulu
      final hasPermission = await LocationHelper.requestLocationPermission();
      if (!hasPermission) {
        throw Exception(
            'Izin lokasi diperlukan untuk menampilkan informasi cuaca.');
      }

      // Dapatkan posisi
      final position = await LocationHelper.getCurrentPosition();

      final response = await http.get(
        Uri.parse(
          '$baseUrl/forecast?latitude=${position.latitude}&longitude=${position.longitude}&current_weather=true&hourly=temperature_2m,weathercode&daily=temperature_2m_max,temperature_2m_min,weathercode',
        ),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Gagal memuat data cuaca: ${response.statusCode}');
      }
    } catch (e) {
      if (e is Exception) {
        rethrow;
      }
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}
