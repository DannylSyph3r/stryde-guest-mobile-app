import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

final calendarDateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final focusedDayProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

// Providers for pickup and drop-off dates
final pickupDateProvider = StateProvider<DateTime?>((ref) => null);
final dropoffDateProvider = StateProvider<DateTime?>((ref) => null);

// Providers for pickup and drop-off times
final pickupTimeProvider =
    StateProvider<TimeOfDay>((ref) => const TimeOfDay(hour: 0, minute: 0));
final dropoffTimeProvider =
    StateProvider<TimeOfDay>((ref) => const TimeOfDay(hour: 12, minute: 59));

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(
            PhosphorIconsBold.warningCircle,
            color: Palette.strydeOrange,
          ),
          10.sbW,
          Text(
            message,
            style: TextStyle(
              color:
                  (Theme.of(context).colorScheme.brightness == Brightness.dark
                      ? Palette.whiteColor
                      : Palette.blackColor),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Palette.buttonBG,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

bool isWithinThreeDays(DateTime? start, DateTime? end) {
  if (start == null || end == null) return true;
  return end.difference(start).inDays <= 2; // 3 days including start day
}
