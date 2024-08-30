import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/theme/palette.dart';

class CustomModal extends StatelessWidget {
  final double modalHeight;
  final Widget child; // Accept any widget as a child

  const CustomModal({
    required this.modalHeight,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: modalHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Palette.darkBG,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Container(
            width: 60.w,
            height: 4.h,
            decoration: ShapeDecoration(
              color: Palette.strydeOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(child: child), // Use the passed child widget here
        ],
      ),
    );
  }
}

void showCustomModal(
  BuildContext context, {
  required double modalHeight,
  required Widget child,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => CustomModal(
      modalHeight: modalHeight,
      child: child,
    ),
  );
}
