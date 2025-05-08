import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherInfoMiniCards extends StatelessWidget {
  const WeatherInfoMiniCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          _buildMiniCard(
            context,
            Icons.air,
            'Angin',
            '12 km/h',
          ),
          SizedBox(width: 12.w),
          _buildMiniCard(
            context,
            Icons.water_drop,
            'Kelembapan',
            '70%',
          ),
          SizedBox(width: 12.w),
          _buildMiniCard(
            context,
            Icons.wb_sunny_outlined,
            'Matahari Terbit',
            '05:30',
          ),
          SizedBox(width: 12.w),
          _buildMiniCard(
            context,
            Icons.wb_sunny,
            'UV Index',
            'Moderate',
          ),
        ],
      ),
    );
  }

  Widget _buildMiniCard(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    final theme = Theme.of(context);

    return Container(
      width: 100.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24.w,
            color: theme.colorScheme.primary,
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Color.fromRGBO(
                (theme.colorScheme.onSurface.r * 255.0).round(),
                (theme.colorScheme.onSurface.g * 255.0).round(),
                (theme.colorScheme.onSurface.b * 255.0).round(),
                0.7,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
