import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class ReceiverMessageBubble extends ConsumerWidget {
  final String messageContent;
  final Color? recieverMessageBubbleColor;
  final String messageTimeStamp;
  final Color? fontColor;
  final double? fontSize;
  const ReceiverMessageBubble(
      {super.key,
      required this.messageContent,
      required this.messageTimeStamp,
      this.recieverMessageBubbleColor,
      this.fontColor,
      this.fontSize});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Palette.strydeOrange,
          radius: 18.w,
        ),
        10.sbW,
        // Transform(
        //   alignment: Alignment.center,
        //   transform: Matrix4.rotationY(math.pi),
        //   child: CustomPaint(
        //     painter: Triangle(recieverMessageBubbleColor ?? Palette.buttonBG),
        //   ),
        // ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding: 10.0.padA,
                  decoration: BoxDecoration(
                    color: recieverMessageBubbleColor ?? Palette.greyColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.r),
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
                      // messageTimeStamp.txt(
                      //     size: 10.sp, color: fontColor ?? Palette.strydeOrange),
                    ],
                  )).alignCenterLeft(),
              5.sbH,
              messageTimeStamp.txt(
                  size: 11.sp, color: fontColor ?? Palette.strydeOrange, textAlign: TextAlign.left).alignCenterLeft(),
            ],
          ),
        ),
      ],
    ));

    return Padding(
      padding: EdgeInsets.only(right: 50.w, left: 10.w, top: 5.h, bottom: 5.h),
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
