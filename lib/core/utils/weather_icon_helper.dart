import 'package:flutter/material.dart';

class WeatherIconHelper {
  static IconData getWeatherIcon(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return Icons.wb_sunny; // Cerah
      case 1:
      case 2:
      case 3:
        return Icons.cloud; // Berawan
      case 45:
      case 48:
        return Icons.cloud_queue; // Berkabut
      case 51:
      case 53:
      case 55:
        return Icons.grain; // Gerimis
      case 61:
      case 63:
      case 65:
        return Icons.beach_access; // Hujan
      case 71:
      case 73:
      case 75:
      case 77:
        return Icons.ac_unit; // Salju
      case 80:
      case 81:
      case 82:
        return Icons.thunderstorm; // Hujan Lebat
      case 95:
      case 96:
      case 99:
        return Icons.flash_on; // Badai
      default:
        return Icons.wb_sunny;
    }
  }

  static Color getWeatherColor(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return const Color(0xFF2196F3); // Cerah - Biru
      case 1:
      case 2:
      case 3:
        return const Color(0xFF78909C); // Berawan - Abu-abu
      case 45:
      case 48:
        return const Color(0xFF90A4AE); // Berkabut - Abu-abu muda
      case 51:
      case 53:
      case 55:
        return const Color(0xFF4FC3F7); // Gerimis - Biru muda
      case 61:
      case 63:
      case 65:
        return const Color(0xFF29B6F6); // Hujan - Biru
      case 71:
      case 73:
      case 75:
      case 77:
        return const Color(0xFFB3E5FC); // Salju - Biru sangat muda
      case 80:
      case 81:
      case 82:
        return const Color(0xFF0288D1); // Hujan Lebat - Biru tua
      case 95:
      case 96:
      case 99:
        return const Color(0xFF01579B); // Badai - Biru gelap
      default:
        return const Color(0xFF2196F3);
    }
  }
}
