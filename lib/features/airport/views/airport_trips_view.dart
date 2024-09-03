import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:stryde_guest_app/features/airport/models/trip_model.dart';
import 'package:stryde_guest_app/features/airport/views/airport_trip_details_view.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/utils/widgets/container_list_tile.dart';

class AirportTripsView extends ConsumerStatefulWidget {
  const AirportTripsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AirportTripsViewState();
}

class _AirportTripsViewState extends ConsumerState<AirportTripsView> {
  // Function to get the suffix for the day
  String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return "th";
    }
    switch (day % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }

  // Function to format the date in the desired format
  String formatDate(DateTime date) {
    final day = date.day;
    final suffix = getDaySuffix(day);
    final formattedDate = DateFormat('d MMM').format(date);
    return "$day$suffix ${formattedDate.split(' ')[1]}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Trips",
        context: context,
        implyLeading: true,
        toolbarHeight: 60.h,
      ),
      body: GroupedListView<Trip, DateTime>(
        padding: 20.padV,
        shrinkWrap: true,
        reverse: true,
        elements: trips,
        groupBy: (Trip trip) {
          return DateTime(
            trip.startTime.year,
            trip.startTime.month,
          );
        },
        groupHeaderBuilder: (Trip trip) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          child: DateFormat.yMMM()
              .format(trip.startTime)
              .txt14()
              .alignCenterLeft(),
        ),
        itemBuilder: (BuildContext context, Trip trip) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.5.h),
            child: OptionSelectionContainerTile(
              horizontalContentPadding: 18.w,
              tileBxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 8.0,
                  spreadRadius: 5.0,
                ),
              ],
              containerColor: Palette.buttonBG,
              interactiveTrailing: true,
              interactiveTrailingWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  10.sbH,
                  "₦${trip.tripAmount}".txt18(fontW: F.w6),
                ],
              ),
              titleLabel:
                  "${trip.startingLocation} to ${trip.destinationLocation}",
              titleFontSize: 12.sp,
              subtitleLabel:
                  "${formatDate(trip.startTime)}, ${trip.vehicleClass}",
              subtitleFontColor: Palette.strydeOrange,
              subtitleFontWeight: F.w6,
              onTileTap: () {
                goTo(
                    context: context,
                    view: AirportTripDetailsView(
                        startingLocation: trip.startingLocation,
                        destinationLocation: trip.destinationLocation,
                        tripStartTime: trip.startTime,
                        tripEndTime: trip.endTime,
                        driverName: "Akinola Daniel Eri-ife"));
              },
            ),
          );
        },
      ),
    );
  }
}
