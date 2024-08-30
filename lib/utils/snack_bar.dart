// import 'package:file_picker/file_picker.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/type_defs.dart';

void showSnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 2000),
        content: text.txt16(
          fontWeight: FontWeight.w500,
          color: Palette.whiteColor,
        ),
      ),
    );
}

//! SHOW BANNER
showFlushBanner({
  required BuildContext context,
  required String theMessage,
  required NotificationType theType,
  Duration? dismissIn,
}) {
  Flushbar(
          messageText: theMessage.txt14(fontW: F.w6, textAlign: TextAlign.left),
          maxWidth: 300.w,
          padding: EdgeInsets.all(15.h),
          duration: const Duration(seconds: 2),
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          borderRadius: BorderRadius.circular(15.r),
          reverseAnimationCurve: Curves.decelerate,
          forwardAnimationCurve: Curves.linearToEaseOut,
          messageColor: Colors.white,
          shouldIconPulse: false,
          icon: Icon(
            theType == NotificationType.failure
                ? PhosphorIconsBold.warningCircle
                : theType == NotificationType.success
                    ? PhosphorIconsBold.checkCircle
                    : PhosphorIconsBold.info,
            color: Palette.strydeOrange,
            size: 30.h,
          ),
          backgroundColor: theType == NotificationType.failure
              ? Palette.buttonBG
              : theType == NotificationType.success
                  ? Palette.buttonBG
                  : Palette.buttonBG)
      .show(context);
}
