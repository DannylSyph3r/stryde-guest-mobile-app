import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class AdDisplayCard extends ConsumerWidget {
  const AdDisplayCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Palette.buttonBG,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "20% off".txt16(fontW: F.w6),
                  5.sbH,
                  "lorem ipsum".txt14()
                ],
              ).alignCenterLeft(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: Palette.greyColor,
                  borderRadius: BorderRadius.circular(18.r)
                ),
                child: Center(
                  child: "Lorem".txt16(),
                ),
              )
            ],
          ).alignCenterLeft(),
          100.sbW,
          Column(
            children: [
              AppGraphics.adAvatar.png.myImage(height: 100.h, fit: BoxFit.cover),
            ],
          )
        ],
      ),
    );
  }
}
