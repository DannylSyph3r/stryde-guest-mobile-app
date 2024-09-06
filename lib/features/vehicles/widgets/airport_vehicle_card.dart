import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class AirportVehicleDisplayCard extends StatelessWidget {
  final String carImagePath;
  final String vehicleClass;
  final String vehicleYear;
  final int rentalRate;
  final double reviewStarCount;
  final VoidCallback onTileTap;

  const AirportVehicleDisplayCard({
    required this.carImagePath,
    required this.vehicleClass,
    required this.vehicleYear,
    required this.rentalRate,
    required this.reviewStarCount,
    required this.onTileTap,
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
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                    child: carImagePath.png.myImage(fit: BoxFit.cover),
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
                        vehicleClass.txt(
                          size: 16.sp,
                          fontW: F.w6,
                          overflow: TextOverflow.ellipsis,
                        ),
                        4.sbH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            vehicleYear.txt(
                              size: 14.sp,
                              color: Palette.whiteColor.withOpacity(0.8),
                              fontW: F.w6,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  PhosphorIconsFill.seat,
                                  size: 16.h,
                                  color: Palette.strydeOrange,
                                ),
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
                        rentalRate.toString().txt(size: 12.sp, fontW: F.w6),
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
