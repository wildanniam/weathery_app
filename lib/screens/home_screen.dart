import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_app_bar.dart';
import '../widgets/current_weather_card.dart';
import '../widgets/weather_info_mini_cards.dart';
import '../widgets/hourly_forecast_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: const WeatherAppBar(),
      body: RefreshIndicator(
        onRefresh: () => weatherProvider.fetchWeather(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              children: [
                if (weatherProvider.isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else if (weatherProvider.error != null)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Text(
                        weatherProvider.error!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else if (weatherProvider.weather != null) ...[
                  CurrentWeatherCard(weather: weatherProvider.weather!),
                  SizedBox(height: 16.h),
                  const WeatherInfoMiniCards(),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Prakiraan 12 Jam',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  HourlyForecastCarousel(
                    forecasts: weatherProvider.weather!.hourlyForecasts
                        .take(12)
                        .toList(),
                  ),
                ] else
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Text(
                        'Tekan tombol refresh untuk memuat data cuaca',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
