import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class VehicleSpecificationsTab extends ConsumerWidget {
  final IconData tabIcon;
  final String tabLabel;

  const VehicleSpecificationsTab(
      {required this.tabIcon, required this.tabLabel, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
          color: Palette.buttonBG, borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(tabIcon, color: Palette.strydeOrange, size: 22.h,),
          10.sbW,
          tabLabel.txt14()
          ],
      ),
    );
  }
}
