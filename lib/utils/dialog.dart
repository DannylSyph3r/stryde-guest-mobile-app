import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

void showCustomSelectionDialog(
    BuildContext context, String title, Widget dialogContent) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        backgroundColor: Palette.whiteColor,
        title: title.txt16(fontW: F.w6, maxLines: 2, overflow: TextOverflow.ellipsis).alignCenter(),
        content: SizedBox(
          height: 500.h,
          width: 500.w,
          child: dialogContent),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: "Close".txt14(),
          ),
        ],
      );
    },
  );
}
