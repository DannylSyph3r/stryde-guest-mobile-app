import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/features/base_nav/wrapper/base_nav_wrapper.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class NavBarWidget extends ConsumerWidget {
  final Nav nav;

  const NavBarWidget({
    Key? key,
    required this.nav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int indexFromController = ref.watch(baseNavControllerProvider);
    bool isSelected = indexFromController == nav.index;

    return AnimatedContainer(
      duration: 300.milliseconds,
      height: 43.h,
      decoration: BoxDecoration(
          color: isSelected ? Palette.buttonBG : Colors.transparent,
          borderRadius: BorderRadius.circular(23.r)),
      // width: isSelected ? 130.h : 55.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isSelected
                ? nav.iconActive.iconPng.myImage(
                    height: 25.h,
                    width: 25.h,
                  )
                : nav.icon.iconPng.myImage(
                    height: 25.h,
                    width: 25.h,
                  ),
            5.sbW,
            Visibility(
                visible: isSelected,
                child: nav.label.txt(size: 13.sp, fontW: F.w6))
          ],
        ),
      ),
    ).gestureTap(
      onTap: () {
        moveToPage(
          context: context,
          ref: ref,
          index: nav.index,
        );
      },
    );
  }
}
