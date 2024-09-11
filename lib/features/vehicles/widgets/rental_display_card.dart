import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

final vehicleLikedNotifier = StateProvider<bool>((ref) {
  return false;
});

class RentalDisplayCard extends ConsumerWidget {
  final Object imageHeroTag;
  final String carImagePath;
  final String manufacturerName;
  final String modelName;
  final double reviewStarCount;
  final VoidCallback onTileTap;
  final VoidCallback onLikeTap;

  const RentalDisplayCard({
    required this.imageHeroTag,
    required this.carImagePath,
    required this.manufacturerName,
    required this.modelName,
    required this.reviewStarCount,
    required this.onTileTap,
    required this.onLikeTap,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool likedTapped = ref.watch(vehicleLikedNotifier);
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
                    child: Hero(
                        tag: imageHeroTag,
                        child: Material(
                            child:
                                carImagePath.png.myImage(fit: BoxFit.cover))),
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
                          color: likedTapped
                              ? Palette.strydeOrange
                              : Palette.whiteColor.withOpacity(0.7),
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
                        Text(
                          manufacturerName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                modelName,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Palette.whiteColor.withOpacity(0.8),
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  PhosphorIconsFill.seat,
                                  size: 16.h,
                                  color: Palette.strydeOrange,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "4",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
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
                            Text(
                              reviewStarCount.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              PhosphorIconsFill.star,
                              size: 18.h,
                              color: Palette.strydeOrange,
                            )
                          ],
                        ),
                        Text(
                          "₦1,250,000 / day",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
