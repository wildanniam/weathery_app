import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class ApiService {
  static const String baseUrl = 'https://api.open-meteo.com/v1';

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Layanan lokasi tidak aktif');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Izin lokasi ditolak');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Izin lokasi ditolak secara permanen');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<Map<String, dynamic>> getWeatherData() async {
    try {
      final position = await getCurrentLocation();

      final response = await http.get(
        Uri.parse(
          '$baseUrl/forecast?latitude=${position.latitude}&longitude=${position.longitude}&current_weather=true&hourly=temperature_2m,weathercode',
        ),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Gagal memuat data cuaca');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
