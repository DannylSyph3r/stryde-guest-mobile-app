import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/widgets/row_railer.dart';

enum NotificationType {
  pickup,
  dropOff,
}

class NotificationDisplayTile extends ConsumerStatefulWidget {
  final NotificationType notificationType;
  final String vehicleName;
  final String scheduledDate; // Date for scheduled pickup/drop-off
  final String scheduledTime; // Time for scheduled pickup/drop-off
  final String notificationDate; // Date for when notification comes in
  final String notificationTime; // Time for when notification comes in
  final String? fromName; // Optional name for rental request

  const NotificationDisplayTile({
    super.key,
    required this.notificationType,
    required this.vehicleName,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.notificationDate,
    required this.notificationTime,
    this.fromName,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationDisplayTileState();
}

class _NotificationDisplayTileState
    extends ConsumerState<NotificationDisplayTile> {
  String get title {
    switch (widget.notificationType) {
      case NotificationType.pickup:
        return "${widget.vehicleName} is due for pick-up today";
      case NotificationType.dropOff:
        return "${widget.vehicleName} is due for drop-off today";
    }
  }

  String get actionText {
    switch (widget.notificationType) {
      case NotificationType.pickup:
        return "Pick-up:";
      case NotificationType.dropOff:
        return "Drop-off:";
    }
  }

  String get fromText {
    return widget.fromName != null
        ? widget.fromName!
        : ''; // Return the name if available
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.buttonBG,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 2.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                PhosphorIconsFill.circle,
                size: 10.h,
                color: Palette.strydeOrange,
              ),
              5.sbW,
              Expanded(
                child: title.txt(
                  size: 13.sp,
                  fontW: F.w6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ).alignCenterLeft(),
          15.sbH,
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: actionText,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
              children: [
                TextSpan(
                  text: "  ", // Add space for clarity
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                TextSpan(
                  text: "${widget.scheduledDate} at ${widget.scheduledTime}",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ).alignCenterLeft(),
          10.sbH, // Additional spacing
          RowRailer(
            rowPadding: 0.padH,
            leading: "${widget.notificationDate}, ${widget.notificationTime}"
                .txt(size: 13.sp),
          ),
        ],
      ),
    );
  }
}
