import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class SenderMessageBubble extends ConsumerWidget {
  final String messageContent;
  final Color? recieverMessageBubbleColor;
  final String messageTimeStamp;
  final Color? fontColor;
  final double? fontSize;
  const SenderMessageBubble({
    super.key,
    required this.messageContent,
    required this.messageTimeStamp,
    this.recieverMessageBubbleColor,
    this.fontColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding: 10.0.padA,
                  decoration: BoxDecoration(
                    color: recieverMessageBubbleColor ?? Palette.strydeOrange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      messageContent.txt(
                          size: fontSize ?? 13.sp,
                          color: fontColor ??
                              (Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Palette.whiteColor
                                  : Palette.blackColor),
                          textAlign: TextAlign.left),
                      // 3.sbH,
                      // Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     Icon(
                      //       PhosphorIconsBold.checks,
                      //       color: Palette.greyColor,
                      //       size: 14.sp,
                      //     ),
                      //     5.sbW,
                      //     messageTimeStamp.txt(
                      //       size: 10.sp,
                      //       color: fontColor ??
                      //           (Theme.of(context).colorScheme.brightness ==
                      //                   Brightness.dark
                      //               ? Palette.whiteColor
                      //               : Palette.blackColor),
                      //     )
                      //   ],
                      // )
                    ],
                  )).alignCenterRight(),
              5.sbH,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon(
                  //   PhosphorIconsBold.checks,
                  //   color: Palette.greyColor,
                  //   size: 14.sp,
                  // ),
                  // 5.sbW,
                  messageTimeStamp.txt(
                    size: 11.sp,
                    color: fontColor ??
                        (Theme.of(context).colorScheme.brightness ==
                                Brightness.dark
                            ? Palette.whiteColor
                            : Palette.blackColor),
                  )
                ],
              ).alignCenterRight()
            ],
          ),
        ),
        // CustomPaint(
        //     painter:
        //         Triangle(recieverMessageBubbleColor ?? Palette.strydeOrange)),
        10.sbW,
        CircleAvatar(
          backgroundColor: Palette.greyColor,
          radius: 18.w,
        ),
      ],
    ));

    return Padding(
      padding: EdgeInsets.only(right: 10.w, left: 50.w, top: 5.h, bottom: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30.h),
          messageTextGroup,
        ],
      ),
    );
  }
}
