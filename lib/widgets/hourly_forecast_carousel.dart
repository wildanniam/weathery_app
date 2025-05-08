import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../models/weather_model.dart';

class HourlyForecastCarousel extends StatelessWidget {
  final List<HourlyForecast> forecasts;

  const HourlyForecastCarousel({
    super.key,
    required this.forecasts,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: forecasts.length,
        itemBuilder: (context, index) {
          final forecast = forecasts[index];
          final isCurrentHour = index == 0;
          final color = _getWeatherColor(forecast.weatherCode);

          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              width: 80.w,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1A237E) // Dark mode
                    : Colors.white, // Light mode
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? color.withAlpha(51) // Dark mode
                      : color.withAlpha(26), // Light mode
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? color.withAlpha(26) // Dark mode
                        : color.withAlpha(13), // Light mode
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isCurrentHour
                        ? 'Sekarang'
                        : DateFormat('HH:mm').format(forecast.time),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF90CAF9) // Dark mode
                              : color, // Light mode
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 8.h),
                  Icon(
                    _getWeatherIcon(forecast.weatherCode),
                    size: 24.w,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF90CAF9) // Dark mode
                        : color, // Light mode
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '${forecast.temperature.toStringAsFixed(1)}°',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF90CAF9) // Dark mode
                              : color, // Light mode
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getWeatherIcon(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return Icons.wb_sunny;
      case 1:
      case 2:
      case 3:
        return Icons.cloud;
      case 45:
      case 48:
        return Icons.cloud_queue;
      case 51:
      case 53:
      case 55:
        return Icons.grain;
      case 61:
      case 63:
      case 65:
        return Icons.beach_access;
      case 71:
      case 73:
      case 75:
      case 77:
        return Icons.ac_unit;
      case 80:
      case 81:
      case 82:
        return Icons.thunderstorm;
      case 95:
      case 96:
      case 99:
        return Icons.flash_on;
      default:
        return Icons.wb_sunny;
    }
  }

  Color _getWeatherColor(int weatherCode) {
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
