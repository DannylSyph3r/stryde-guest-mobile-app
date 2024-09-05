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

  const RentalDisplayCard({
    required this.carImagePath,
    required this.manufacturerName,
    required this.modelName,
    required this.reviewStarCount,
    required this.onTileTap,
    required this.onLikeTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTileTap,
      child: Container(
        decoration: BoxDecoration(
          color: Palette.buttonBG,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 8.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12.r)),
                    child: carImagePath.png.myImage(fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: GestureDetector(
                      onTap: onLikeTap,
                      child: Container(
                        height: 32.h,
                        width: 32.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Palette.greyColor.withOpacity(0.6),
                        ),
                        child: Icon(
                          PhosphorIconsFill.heartStraight,
                          color: Palette.strydeOrange,
                          size: 18.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        manufacturerName.txt(
                          size: 16.sp,
                          fontW: F.w6,
                          overflow: TextOverflow.ellipsis,
                        ),
                        4.sbH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            modelName.txt(
                              size: 14.sp,
                              color: Palette.whiteColor.withOpacity(0.8),
                              fontW: F.w6,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(PhosphorIconsFill.seat, size: 16.h, color: Palette.strydeOrange,),
                                5.sbW,
                                "4".txt14(fontW: F.w6)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            reviewStarCount.toString().txt(
                                  size: 14.sp,
                                  fontW: F.w4,
                                ),
                            4.sbW,
                            Icon(
                              PhosphorIconsFill.star,
                              size: 18.h,
                              color: Palette.strydeOrange,
                            )
                          ],
                        ),
                        "₦250,000 / day".txt(size: 12.sp, fontW: F.w6),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
