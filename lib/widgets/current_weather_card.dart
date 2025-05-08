import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../models/weather_model.dart';

class CurrentWeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const CurrentWeatherCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final dateFormat = DateFormat('EEEE, d MMMM yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: theme.brightness == Brightness.dark
                ? [
                    const Color(0xFF1A237E),
                    const Color(0xFF0D47A1)
                  ] // Dark mode
                : [
                    const Color(0xFF2196F3),
                    const Color(0xFF64B5F6)
                  ], // Light mode
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Lokasi dan Waktu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jakarta, ID',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.brightness == Brightness.dark
                                ? const Color(0xFF90CAF9) // Dark mode
                                : Colors.white, // Light mode
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '${dateFormat.format(now)} • ${timeFormat.format(now)}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.brightness == Brightness.dark
                                ? const Color(0xFF64B5F6)
                                    .withAlpha(179) // Dark mode
                                : Colors.white.withAlpha(179), // Light mode
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Ikon dan Suhu
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildWeatherIcon(context, weather.weatherCode),
                  SizedBox(width: 16.w),
                  Text(
                    '${weather.temperature.toStringAsFixed(1)}°',
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: theme.brightness == Brightness.dark
                          ? const Color(0xFF90CAF9) // Dark mode
                          : Colors.white, // Light mode
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),

              // Deskripsi Cuaca
              Text(
                weather.getWeatherDescription(),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.brightness == Brightness.dark
                      ? const Color(0xFF90CAF9) // Dark mode
                      : Colors.white, // Light mode
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),

              // Detail Cuaca
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: theme.brightness == Brightness.dark
                      ? const Color(0xFF0D47A1).withAlpha(102) // Dark mode
                      : Colors.white.withAlpha(102), // Light mode
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildWeatherDetail(
                      context,
                      Icons.thermostat,
                      'Sensasi',
                      '${(weather.temperature - 2).toStringAsFixed(1)}°',
                    ),
                    _buildWeatherDetail(
                      context,
                      Icons.water_drop,
                      'Kelembapan',
                      '65%',
                    ),
                    _buildWeatherDetail(
                      context,
                      Icons.speed,
                      'Tekanan',
                      '1013 hPa',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOut,
        );
  }

  Widget _buildWeatherIcon(BuildContext context, int weatherCode) {
    final theme = Theme.of(context);
    IconData iconData;
    switch (weatherCode) {
      case 0:
        iconData = Icons.wb_sunny;
        break;
      case 1:
      case 2:
      case 3:
        iconData = Icons.cloud;
        break;
      case 45:
      case 48:
        iconData = Icons.cloud_queue;
        break;
      case 51:
      case 53:
      case 55:
        iconData = Icons.grain;
        break;
      case 61:
      case 63:
      case 65:
        iconData = Icons.beach_access;
        break;
      case 71:
      case 73:
      case 75:
      case 77:
        iconData = Icons.ac_unit;
        break;
      case 80:
      case 81:
      case 82:
        iconData = Icons.thunderstorm;
        break;
      case 95:
      case 96:
      case 99:
        iconData = Icons.flash_on;
        break;
      default:
        iconData = Icons.wb_sunny;
    }

    return Icon(
      iconData,
      size: 64.w,
      color: theme.brightness == Brightness.dark
          ? const Color(0xFF90CAF9) // Dark mode
          : Colors.white, // Light mode
    );
  }

  Widget _buildWeatherDetail(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(
          icon,
          color: theme.brightness == Brightness.dark
              ? const Color(0xFF90CAF9) // Dark mode
              : Colors.white, // Light mode
          size: 24.w,
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.brightness == Brightness.dark
                ? const Color(0xFF64B5F6).withAlpha(179) // Dark mode
                : Colors.white.withAlpha(179), // Light mode
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.brightness == Brightness.dark
                ? const Color(0xFF90CAF9) // Dark mode
                : Colors.white, // Light mode
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
