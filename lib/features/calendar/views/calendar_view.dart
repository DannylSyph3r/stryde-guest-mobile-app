import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/calendar/providers/calendar_providers.dart';
import 'package:stryde_guest_app/features/calendar/widgets/selection_calendar.dart';
import 'package:stryde_guest_app/features/vehicles/views/rental_summary_view.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/utils/widgets/button.dart';

class CalendarView extends ConsumerWidget {
  const CalendarView({Key? key}) : super(key: key);

  String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  Future<void> _selectTime(
      BuildContext context, WidgetRef ref, bool isPickup) async {
    final currentTime =
        isPickup ? ref.read(pickupTimeProvider) : ref.read(dropoffTimeProvider);

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: Theme(
            data: Theme.of(context).copyWith(
              timePickerTheme: Theme.of(context).timePickerTheme.copyWith(
                    hourMinuteShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hourMinuteTextStyle: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    dayPeriodTextStyle: TextStyle(
                      fontSize: 14.sp,
                    ),
                    helpTextStyle: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 14.sp),
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
      initialEntryMode: TimePickerEntryMode.input,
    );

    if (pickedTime != null) {
      if (isPickup) {
        ref.read(pickupTimeProvider.notifier).state = pickedTime;
      } else {
        ref.read(dropoffTimeProvider.notifier).state = pickedTime;
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickupDate = ref.watch(pickupDateProvider);
    final dropoffDate = ref.watch(dropoffDateProvider);
    final pickupTime = ref.watch(pickupTimeProvider);
    final dropoffTime = ref.watch(dropoffTimeProvider);

    return Scaffold(
      appBar: customAppBar(
          title: "Calendar",
          context: context,
          color: Colors.transparent,
          isTitleCentered: true,
          overrideBackButtonAction: true,
          backFunction: () {
            ref.invalidate(pickupDateProvider);
            ref.invalidate(dropoffDateProvider);
            ref.read(pickupTimeProvider.notifier).state =
                const TimeOfDay(hour: 0, minute: 0);
            ref.read(dropoffTimeProvider.notifier).state =
                const TimeOfDay(hour: 12, minute: 59);
          }),
      body: Padding(
        padding: 15.padH,
        child: ListView(
          children: [
            10.sbH,
            SelectionCalendar(
              onDateSelected: (selectedDate) {
                if (pickupDate == null) {
                  ref.read(pickupDateProvider.notifier).state = selectedDate;
                } else if (dropoffDate == null) {
                  if (isWithinThreeDays(pickupDate, selectedDate)) {
                    ref.read(dropoffDateProvider.notifier).state = selectedDate;
                  } else {
                    showSnackBar(context, "Maximum limit is 3 days");
                  }
                } else {
                  // Reset dates if both are already selected
                  ref.read(pickupDateProvider.notifier).state = selectedDate;
                  ref.read(dropoffDateProvider.notifier).state = null;
                }
              },
            ),
            20.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    "Duration:".txt16(fontW: F.w6),
                    5.sbW,
                    if (pickupDate != null && dropoffDate != null)
                      "${dropoffDate.difference(pickupDate).inDays + 1} Days"
                          .txt16(fontW: F.w6, color: Palette.strydeOrange),
                  ],
                ),
                if (pickupDate != null)
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                        color: Palette.strydeOrange,
                        borderRadius: BorderRadius.circular(21.r)),
                    child: "Reset".txt14(),
                  ).tap(onTap: () {
                    ref.read(pickupDateProvider.notifier).state = null;
                    ref.read(dropoffDateProvider.notifier).state = null;
                    ref.read(pickupTimeProvider.notifier).state =
                        const TimeOfDay(hour: 0, minute: 0);
                    ref.read(dropoffTimeProvider.notifier).state =
                        const TimeOfDay(hour: 12, minute: 59);
                  }),
              ],
            ),
            20.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: 15.0.padA,
                  decoration: BoxDecoration(
                      color: Palette.buttonBG,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 8.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(18.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            PhosphorIconsFill.circle,
                            color: Palette.strydeOrange,
                            size: 20.h,
                          ),
                          10.sbW,
                          "Pick-up".txt14(fontW: F.w6)
                        ],
                      ),
                      10.sbH,
                      (pickupDate != null
                              ? DateFormat('d MMMM, yyyy').format(pickupDate)
                              : "Select date")
                          .txt12()
                    ],
                  ),
                ),
                20.sbW,
                Container(
                  padding: 15.0.padA,
                  decoration: BoxDecoration(
                      color: Palette.buttonBG,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 8.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(18.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            PhosphorIconsFill.circle,
                            color: Palette.whiteColor,
                            size: 20.h,
                          ),
                          10.sbW,
                          "Drop-off".txt14(fontW: F.w6)
                        ],
                      ),
                      10.sbH,
                      (dropoffDate != null
                              ? DateFormat('d MMMM, yyyy').format(dropoffDate)
                              : "Select date")
                          .txt12()
                    ],
                  ),
                ),
              ],
            ),
            30.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: 15.0.padA,
                  decoration: BoxDecoration(
                      color: Palette.buttonBG,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 8.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                      border: Border.all(color: Palette.strydeOrange),
                      borderRadius: BorderRadius.circular(18.r)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        PhosphorIconsFill.clock,
                        color: Palette.strydeOrange,
                        size: 25.h,
                      ),
                      10.sbW,
                      pickupTime.format(context).txt(size: 12.sp, fontW: F.w6)
                    ],
                  ),
                ).tap(onTap: () => _selectTime(context, ref, true)),
                20.sbW,
                Container(
                  padding: 15.0.padA,
                  decoration: BoxDecoration(
                      color: Palette.buttonBG,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 8.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                      border: Border.all(color: Palette.strydeOrange),
                      borderRadius: BorderRadius.circular(18.r)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        PhosphorIconsFill.clock,
                        color: Palette.whiteColor,
                        size: 25.h,
                      ),
                      10.sbW,
                      dropoffTime.format(context).txt(size: 12.sp, fontW: F.w6)
                    ],
                  ),
                ).tap(onTap: () => _selectTime(context, ref, false)),
              ],
            ),
            50.sbH,
            if (pickupDate != null && dropoffDate != null)
              AppButton(
                text: "Proceed",
                onTap: () {
                  goTo(
                      context: context,
                      view: RentalSummaryView(
                          vehicleManufacturerName: "Mercedes-Benz",
                          vehicleModelName: "G-Class",
                          exchangeLocation: "Abuja",
                          daysDuration:
                              "${dropoffDate.difference(pickupDate).inDays + 1}",
                          pickUpDate: pickupDate,
                          dropOffDate: dropoffDate,
                          pickupTime: pickupTime,
                          dropOffTime: dropoffTime));
                },
              ).alignCenter(),
            50.sbH
          ],
        ),
      ),
    );
  }
}
