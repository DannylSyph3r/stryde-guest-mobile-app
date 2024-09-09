import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/base_nav/wrapper/base_nav_wrapper.dart';
import 'package:stryde_guest_app/features/calendar/providers/calendar_providers.dart';
import 'package:stryde_guest_app/shared/app_texts.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/button.dart';
import 'package:stryde_guest_app/utils/widgets/vertical_railer.dart';

class RentalRequestConfirmationView extends ConsumerWidget {
  const RentalRequestConfirmationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: VerticalRailer(
            columnPadding: 50.padV,
            middle: Column(
              children: [
                Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(
                    PhosphorIconsFill.checkCircle,
                    size: 100.h,
                    color: Palette.strydeOrange,
                  ),
                  // .animate().scaleY(duration: 250.milliseconds),
                  30.sbH,
                  AppTexts.rentalRequestConfirmation
                      .txt16(textAlign: TextAlign.center)
                  // .animate().fadeIn(duration: 3.seconds),
                ]),
              ],
            ),
            bottom: AppButton(
                text: "Proceed",
                onTap: () {
                  ref.invalidate(pickupDateProvider);
                  ref.invalidate(dropoffDateProvider);
                  ref.read(pickupTimeProvider.notifier).state =
                      const TimeOfDay(hour: 0, minute: 0);
                  ref.read(dropoffTimeProvider.notifier).state =
                      const TimeOfDay(hour: 12, minute: 59);
                  goToAndReplace(context: context, view: BaseNavWrapper());
                })
            // .animate().fadeIn(duration: 3.seconds),
            ));
  }
}
