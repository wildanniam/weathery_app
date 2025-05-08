import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_app_bar.dart';
import '../widgets/current_weather_card.dart';
import '../widgets/weather_info_mini_cards.dart';
import '../widgets/hourly_forecast_carousel.dart';
import '../widgets/daily_forecast_list.dart';
import '../core/layout/responsive_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: const WeatherAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.getHorizontalPadding(context),
            vertical: ResponsiveHelper.getVerticalPadding(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (weatherProvider.isLoading)
                const Center(child: CircularProgressIndicator())
              else if (weatherProvider.error != null)
                Center(
                  child: Text(
                    weatherProvider.error!,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              else if (weatherProvider.weather != null) ...[
                CurrentWeatherCard(weather: weatherProvider.weather!),
                SizedBox(height: ResponsiveHelper.getSpacing(context)),
                const WeatherInfoMiniCards(),
                SizedBox(height: ResponsiveHelper.getSpacing(context)),
                Text(
                  'Prakiraan 12 Jam',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: ResponsiveHelper.getTitleMedium(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                HourlyForecastCarousel(
                  forecasts: weatherProvider.weather!.hourlyForecasts
                      .take(12)
                      .toList(),
                ),
                SizedBox(height: ResponsiveHelper.getSpacing(context)),
                Text(
                  'Prakiraan 7 Hari',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: ResponsiveHelper.getTitleMedium(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                DailyForecastList(
                  forecasts:
                      weatherProvider.weather!.forecasts.take(7).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
