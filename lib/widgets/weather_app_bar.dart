import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/weather_provider.dart';
import '../providers/theme_provider.dart';
import '../core/layout/responsive_helper.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            Color.fromARGB(
              (0.8 * 255).round(),
              (theme.colorScheme.primary.r * 255).round(),
              (theme.colorScheme.primary.g * 255).round(),
              (theme.colorScheme.primary.b * 255).round(),
            ),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(
              (0.1 * 255).round(),
              0,
              0,
              0,
            ),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Weatherify',
          style: TextStyle(
            fontSize: ResponsiveHelper.getTitleLarge(context),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.location_on,
            size: ResponsiveHelper.getIconSize(context),
            color: Colors.white,
          ),
          onPressed: () => weatherProvider.fetchWeatherData(),
        ),
        actions: [
          if (weatherProvider.isLoading)
            Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                width: ResponsiveHelper.getIconSize(context),
                height: ResponsiveHelper.getIconSize(context),
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .rotate(
                  duration: const Duration(seconds: 1),
                  curve: Curves.linear,
                )
          else ...[
            IconButton(
              icon: Icon(
                themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                size: ResponsiveHelper.getIconSize(context),
                color: Colors.white,
              ),
              onPressed: () => themeProvider.toggleTheme(),
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                size: ResponsiveHelper.getIconSize(context),
                color: Colors.white,
              ),
              onPressed: () => weatherProvider.fetchWeatherData(),
            ),
          ],
        ],
      ),
    );
  }
}
