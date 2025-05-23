import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../models/weather_model.dart';

class DailyForecastList extends StatelessWidget {
  final List<DailyForecast> forecasts;

  const DailyForecastList({
    super.key,
    required this.forecasts,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: forecasts.length,
      itemBuilder: (context, index) {
        final forecast = forecasts[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: _buildForecastItem(context, forecast, index),
        )
            .animate()
            .slideX(
              begin: 0.2,
              end: 0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              delay: Duration(milliseconds: index * 100),
            )
            .fadeIn(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              delay: Duration(milliseconds: index * 100),
            );
      },
    );
  }

  Widget _buildForecastItem(
    BuildContext context,
    DailyForecast forecast,
    int index,
  ) {
    final theme = Theme.of(context);
    final dayFormat = DateFormat('EEEE');
    final isToday = index == 0;
    final color = _getWeatherColor(forecast.weatherCode);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark
            ? const Color(0xFF1A237E) // Dark mode
            : Colors.white, // Light mode
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.brightness == Brightness.dark
                ? const Color(0xFF64B5F6).withAlpha(26) // Dark mode
                : const Color.fromRGBO(0, 0, 0, 0.05), // Light mode
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Hari
          SizedBox(
            width: 90.w,
            child: Text(
              isToday ? 'Hari Ini' : dayFormat.format(forecast.date),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.brightness == Brightness.dark
                    ? const Color(0xFF90CAF9) // Dark mode
                    : theme.colorScheme.onSurface, // Light mode
                fontSize: 12.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Ikon Cuaca
          Icon(
            _getWeatherIcon(forecast.weatherCode),
            size: 20.w,
            color: theme.brightness == Brightness.dark
                ? const Color(0xFF90CAF9) // Dark mode
                : color, // Light mode
          ),
          SizedBox(width: 8.w),
          // Suhu dan Keterangan
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${forecast.maxTemperature.toStringAsFixed(1)}° / ${forecast.minTemperature.toStringAsFixed(1)}°',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.brightness == Brightness.dark
                        ? const Color(0xFF90CAF9) // Dark mode
                        : theme.colorScheme.onSurface, // Light mode
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    _getWeatherDescription(forecast.weatherCode),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.brightness == Brightness.dark
                          ? const Color(0xFF64B5F6).withAlpha(179) // Dark mode
                          : theme.colorScheme.onSurface
                              .withAlpha(179), // Light mode
                      fontSize: 12.sp,
                    ),
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
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

  String _getWeatherDescription(int weatherCode) {
    switch (weatherCode) {
      case 0:
        return 'Cerah';
      case 1:
      case 2:
      case 3:
        return 'Berawan';
      case 45:
      case 48:
        return 'Berkabut';
      case 51:
      case 53:
      case 55:
        return 'Gerimis';
      case 61:
      case 63:
      case 65:
        return 'Hujan';
      case 71:
      case 73:
      case 75:
      case 77:
        return 'Salju';
      case 80:
      case 81:
      case 82:
        return 'Hujan Lebat';
      case 95:
      case 96:
      case 99:
        return 'Badai';
      default:
        return 'Cerah';
    }
  }
}
