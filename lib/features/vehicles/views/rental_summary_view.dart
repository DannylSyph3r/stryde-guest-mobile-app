import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/vehicles/views/rental_request_confirmation_view.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';

class RentalSummaryView extends ConsumerWidget {
  final String vehicleManufacturerName;
  final String vehicleModelName;
  final String exchangeLocation;
  final String daysDuration;
  final DateTime pickUpDate;
  final DateTime dropOffDate;
  final TimeOfDay pickupTime;
  final TimeOfDay dropOffTime;
  const RentalSummaryView(
      {required this.vehicleManufacturerName,
      required this.vehicleModelName,
      required this.exchangeLocation,
      required this.daysDuration,
      required this.pickUpDate,
      required this.dropOffDate,
      required this.pickupTime,
      required this.dropOffTime,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: customAppBar(
          title: "Summary",
          context: context,
          color: Colors.transparent,
          isTitleCentered: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: 15.padH,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vehicleManufacturerName.txt16(fontW: F.w6),
                      5.sbH,
                      vehicleModelName.txt14()
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        PhosphorIconsFill.mapPin,
                        color: Palette.strydeOrange,
                      ),
                      5.sbW,
                      exchangeLocation.txt14()
                    ],
                  )
                ],
              ),
            ),
            10.sbH,
            const Divider(
              thickness: 5,
              color: Palette.buttonBG,
            ),
            10.sbH,
            Padding(
              padding: 15.padH,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Date".txt16(fontW: F.w6),
                  "Duration: $daysDuration days".txt16()
                ],
              ),
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
                      DateFormat('d MMMM, yyyy').format(pickUpDate).txt12()
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
                      DateFormat('d MMMM, yyyy').format(dropOffDate).txt12()
                    ],
                  ),
                ),
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        PhosphorIconsFill.clock,
                        color: Palette.whiteColor,
                        size: 25.h,
                      ),
                      10.sbW,
                      dropOffTime.format(context).txt(size: 12.sp, fontW: F.w6)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        floatingActionButton: Container(
          padding: 10.0.padA,
          height: 60.h,
          width: 350.h,
          decoration: BoxDecoration(
            color: Palette.blackColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Padding(
            padding: 10.padH,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Total Price: ₦250,000".txt16(fontW: F.w6),
                Container(
                  height: 40.h,
                  width: 100.h,
                  decoration: BoxDecoration(
                    color: Palette.strydeOrange,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Center(child: "Rent".txt16()),
                ).tap(onTap: () {
                  goToAndReplace(
                      context: context,
                      view: RentalRequestConfirmationScreen());
                }),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
