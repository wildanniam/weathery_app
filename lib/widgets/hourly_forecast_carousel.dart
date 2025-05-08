import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: _buildForecastItem(
              context,
              forecast,
              isCurrentHour,
            ),
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .slideX(
                begin: 0.2,
                end: 0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
                delay: Duration(milliseconds: index * 100),
              );
        },
      ),
    );
  }

  Widget _buildForecastItem(
    BuildContext context,
    HourlyForecast forecast,
    bool isCurrentHour,
  ) {
    final theme = Theme.of(context);
    final timeFormat = DateFormat('HH:mm');
    final color = _getWeatherColor(forecast.weatherCode);

    // Menggunakan Color.fromARGB untuk opacity
    final borderColor = Color.fromARGB(
      (0.2 * 255).round(),
      (color.toARGB32() >> 16) & 0xFF,
      (color.toARGB32() >> 8) & 0xFF,
      color.toARGB32() & 0xFF,
    );

    final shadowColor = Color.fromARGB(
      (0.1 * 255).round(),
      (color.toARGB32() >> 16) & 0xFF,
      (color.toARGB32() >> 8) & 0xFF,
      color.toARGB32() & 0xFF,
    );

    return Container(
      width: 80.w,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isCurrentHour ? 'Sekarang' : timeFormat.format(forecast.time),
            style: theme.textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Icon(
            _getWeatherIcon(forecast.weatherCode),
            size: 24.w,
            color: color,
          ),
          SizedBox(height: 8.h),
          Text(
            '${forecast.temperature.toStringAsFixed(1)}°',
            style: theme.textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
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
