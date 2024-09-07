import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/airport_vehicle_card.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/utils/widgets/row_railer.dart';
import 'package:intl/intl.dart';

class AirportTripDetailsView extends ConsumerStatefulWidget {
  final String startingLocation;
  final String destinationLocation;
  final DateTime tripStartTime;
  final DateTime tripEndTime;
  final String driverName;

  const AirportTripDetailsView({
    required this.startingLocation,
    required this.destinationLocation,
    required this.tripStartTime,
    required this.tripEndTime,
    required this.driverName,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AirportTripDetailsViewState();
}

class _AirportTripDetailsViewState
    extends ConsumerState<AirportTripDetailsView> {
  // Function to format the DateTime to a time string like "3:30 AM"
  String formatTime(DateTime dateTime) {
    return DateFormat('h:mm a').format(dateTime);
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('d MMM yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Trip Details",
        context: context,
        implyLeading: true,
        toolbarHeight: 60.h,
      ),
      body: ListView(
        padding: 15.padH,
        children: [
          20.sbH,
          "Route".txt18(fontW: F.w6),
          20.sbH,
          RowRailer(
            rowPadding: 0.padH,
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.startingLocation.txt14(fontW: F.w6),
                5.sbH,
                formatTime(widget.tripStartTime)
                    .txt12(color: Palette.strydeOrange),
              ],
            ).alignCenterRight(),
            middle: Padding(
              padding: 20.padH,
              child: const Icon(
                PhosphorIconsBold.caretCircleRight,
                color: Palette.strydeOrange,
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.destinationLocation.txt14(fontW: F.w6),
                5.sbH,
                formatTime(widget.tripEndTime)
                    .txt12(color: Palette.strydeOrange),
              ],
            ).alignCenterLeft(),
          ),
          30.sbH,
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Container(
              child: AppGraphics.mapPL.png
                  .myImage(height: 230.h, fit: BoxFit.cover),
            ),
          ),
          20.sbH,
          "Driver".txt18(fontW: F.w6),
          20.sbH,
          Container(
            padding: 15.0.padA,
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // First Row: Avatar and Text Details
                  child: Row(
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.h,
                        decoration: BoxDecoration(
                          color: Palette.buttonBG.withOpacity(0.5),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Palette.strydeOrange.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: AppGraphics.memeoji.png
                              .myImage(fit: BoxFit.contain),
                        ),
                      ),
                      15.sbW,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Akinola Daniel Eri-ife".txt16(
                              fontW: F.w6,
                              overflow:
                                  TextOverflow.ellipsis, // Handle overflow
                            ),
                            3.sbH,
                            formatDate(widget.tripStartTime)
                                .txt14(color: Palette.strydeOrange),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          20.sbH,
          "Vehicle".txt18(fontW: F.w6),
          20.sbH,
          SizedBox(
                  height: 260.h,
                  width: 190.w,
                  child: AirportVehicleDisplayCard(
                      carImagePath: AppGraphics.carPlOne,
                      vehicleClass: "SUV",
                      vehicleYear: "2013",
                      rentalRate: 50000,
                      reviewStarCount: 3.7,
                      onTileTap: () {}))
              .alignCenterLeft(),
          50.sbH
        ],
      ),
    );
  }
}
