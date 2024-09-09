import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/rental_card_event_list_tile.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class RentalList extends ConsumerWidget {
  final String imageHeroTag;
  final String carImagePath;
  final String vehicleBrandName;
  final String vehicleLocation;
  final String vehicleModel;
  final String vehicleTrim;
  final String rentalRate;
  final VoidCallback onRentalListTap;

  const RentalList({
    required this.imageHeroTag,
    required this.carImagePath,
    required this.vehicleBrandName,
    required this.vehicleLocation,
    required this.vehicleModel,
    required this.vehicleTrim,
    required this.rentalRate,
    required this.onRentalListTap,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: GestureDetector(
        onTap: onRentalListTap,
        child: Container(
          decoration: BoxDecoration(
            color: Palette.buttonBG,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 4),
                blurRadius: 8.0,
                spreadRadius: 5.0,
              ),
            ],
          ),
          child: Row(
            children: [
              // Image container with specific height and width
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 200.h, // Minimum height
                      maxHeight: 200.h, // Maximum height
                      minWidth: 120.h, // Set proportional minWidth
                      maxWidth: 120.h, // Set proportional maxWidth
                    ),
                    child: Hero(
                      tag: imageHeroTag,
                      child: Material(
                        child: carImagePath.png.myImage(
                          fit: BoxFit.cover, // Use cover for better scaling
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              10.sbW,
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      vehicleBrandName
                          .txt(
                            size: 15.sp,
                            fontW: F.w6,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          )
                          .alignCenterLeft(),
                      5.sbH,
                      vehicleTrim
                          .txt(
                            size: 13.sp,
                            textAlign: TextAlign.left,
                          )
                          .alignCenterLeft(),
                      5.sbH,
                      RentalCardEventListTile(
                        horizontalContentPadding: 5.w,
                        leadingIcon: PhosphorIconsFill.circle,
                        leadingIconColor: Palette.strydeOrange,
                        leadingIconSize: 15.h,
                        titleLabel: "Pick-up",
                        titleFontWeight: F.w6,
                        subtitleLabel: "28th September 2024 8:88PM",
                        subtitleFontSize: 12.sp,
                        interactiveTrailing: false,
                      ),
                      RentalCardEventListTile(
                        horizontalContentPadding: 5.w,
                        leadingIcon: PhosphorIconsFill.circle,
                        leadingIconColor: Palette.whiteColor,
                        leadingIconSize: 15.h,
                        titleLabel: "Drop-off",
                        titleFontWeight: F.w6,
                        subtitleLabel: "28th September 2024 8:88PM",
                        subtitleFontSize: 12.sp,
                        interactiveTrailing: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
