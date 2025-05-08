import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/layout/responsive_helper.dart';

class ErrorCard extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorCard({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.all(ResponsiveHelper.getHorizontalPadding(context)),
      padding: EdgeInsets.all(ResponsiveHelper.getCardPadding(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          ResponsiveHelper.getCardBorderRadius(context),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(
              (0.05 * 255).round(),
              0,
              0,
              0,
            ),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: ResponsiveHelper.getLargeIconSize(context),
            color: theme.colorScheme.error,
          ),
          SizedBox(height: ResponsiveHelper.getSpacing(context)),
          Text(
            message,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: ResponsiveHelper.getBodyLarge(context),
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ResponsiveHelper.getSpacing(context)),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: Icon(
              Icons.refresh,
              size: ResponsiveHelper.getIconSize(context),
            ),
            label: Text(
              'Coba Lagi',
              style: TextStyle(
                fontSize: ResponsiveHelper.getBodyMedium(context),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.getButtonPadding(context),
                vertical: ResponsiveHelper.getSpacing(context),
              ),
              minimumSize: Size(
                0,
                ResponsiveHelper.getButtonHeight(context),
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        )
        .slideY(
          begin: 0.2,
          end: 0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
  }
}
