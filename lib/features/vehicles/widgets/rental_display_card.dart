import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class RentalDisplayCard extends StatelessWidget {
  final String carImagePath;
  final String manufacturerName;
  final String modelName;
  final double reviewStarCount;
  final VoidCallback onTileTap;
  final VoidCallback onLikeTap;
  const RentalDisplayCard(
      {required this.carImagePath,
      required this.manufacturerName,
      required this.modelName,
      required this.reviewStarCount,
      required this.onTileTap,
      required this.onLikeTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        child: Container(
          width: 170.w,
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
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  carImagePath.png
                      .myImage(width: 170.w, height: 140.w, fit: BoxFit.cover),
                  Positioned(
                    top: 15.h,
                    right: 10.w,
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.greyColor.withOpacity(0.6),
                      ),
                      child: const Icon(
                        PhosphorIconsFill.heartStraight,
                        color: Palette.strydeOrange,
                      ),
                    ).tap(onTap: onLikeTap),
                  ),
                ],
              ),
              10.sbH,
              Padding(
                padding: 10.padH,
                child: manufacturerName
                    .txt(
                        size: 17.sp,
                        textAlign: TextAlign.left,
                        fontW: F.w6,
                        overflow: TextOverflow.ellipsis)
                    .alignCenterLeft(),
              ),
              5.sbH,
              Padding(
                padding: 10.padH,
                child: modelName
                    .txt14(
                        color: Palette.strydeOrange,
                        fontW: F.w6,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis)
                    .alignCenterLeft(),
              ),
              15.sbH,
              Padding(
                padding: 10.padH,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          reviewStarCount
                              .toString()
                              .txt16(textAlign: TextAlign.left, fontW: F.w4),
                          5.sbW,
                          Icon(
                            PhosphorIconsFill.star,
                            size: 18.h,
                            color: Palette.strydeOrange,
                          )
                        ],
                      ),
                      "₦250,000 / day".txt12(fontW: F.w6),
                    ]),
              )
            ],
          ),
        ).tap(onTap: onTileTap),
      ),
    );
  }
}
