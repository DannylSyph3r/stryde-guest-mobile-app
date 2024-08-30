import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/rental_card_event_list_tile.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class RentalList extends ConsumerWidget {
  final String vehicleBrandName;
  final String vehicleLocation;
  final String vehicleModel;
  final String vehicleTrim;
  final String rentalRate;
  final VoidCallback onRentalListTap;

  const RentalList({
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
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                  ),
                  child: AppGraphics.carPlOne.png.myImage(
                    height: 160.h,
                    width: 140.h,
                    fit: BoxFit.cover,
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
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: vehicleBrandName
                                .txt(
                                  size: 15.sp,
                                  fontW: F.w6,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                )
                                .alignCenterLeft(),
                          ),
                        ],
                      ),
                      5.sbH,
                      vehicleTrim
                          .txt(
                            size: 13.sp,
                            textAlign: TextAlign.left,
                          )
                          .alignCenterLeft(),
                      5.sbH,
                      Row(
                        children: [
                          Expanded(
                            child: RentalCardEventListTile(
                              horizontalContentPadding: 5.w,
                              leadingIcon: PhosphorIconsFill.circle,
                              leadingIconColor: Palette.strydeOrange,
                              leadingIconSize: 15.h,
                              titleLabel: "Pick-up",
                              titleFontWeight: F.w6,
                              subtitleLabel: "11th January 2024 3:30PM",
                              subtitleFontSize: 12.sp,
                              interactiveTrailing: false,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RentalCardEventListTile(
                              horizontalContentPadding: 5.w,
                              leadingIcon: PhosphorIconsFill.circle,
                              leadingIconColor: Palette.whiteColor,
                              leadingIconSize: 15.h,
                              titleLabel: "Drop-off",
                              titleFontWeight: F.w6,
                              subtitleLabel: "13th January 2024 3:30PM",
                              subtitleFontSize: 12.sp,
                              interactiveTrailing: false,
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
      ),
    );
  }
}
