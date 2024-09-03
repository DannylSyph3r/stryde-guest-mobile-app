import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class OptionSelectionContainerTile extends StatelessWidget {
  final IconData? leadingIcon;
  final double? horizontalContentPadding;
  final double? titleFontSize;
  final F? titleFontWeight;
  final double? leadingIconSize;
  final double? subtitleFontSize;
  final F? subtitleFontWeight;
  final String titleLabel;
  final String? subtitleLabel;
  final bool interactiveTrailing;
  final bool? isThreeLines;
  final Color? containerColor;
  final Color? leadingIconColor;
  final Color? titleFontColor;
  final Color? subtitleFontColor;
  final Widget? interactiveTrailingWidget;
  final List<BoxShadow>? tileBxShadow;
  final bool? contentOpacity;
  final void Function()? onTileTap;

  const OptionSelectionContainerTile({
    super.key,
    this.horizontalContentPadding,
    required this.interactiveTrailing,
    this.isThreeLines = false,
    this.interactiveTrailingWidget,
    this.leadingIconSize,
    this.leadingIcon,
    this.leadingIconColor,
    this.containerColor,
    this.titleFontColor,
    this.subtitleFontColor,
    this.subtitleLabel,
    required this.titleLabel,
    this.titleFontSize,
    this.titleFontWeight,
    this.subtitleFontSize,
    this.subtitleFontWeight,
    this.tileBxShadow,
    this.contentOpacity,
    this.onTileTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTileTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: horizontalContentPadding ?? 10.w,
        ),
        decoration: BoxDecoration(
          color: containerColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: tileBxShadow,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (leadingIcon != null) ...[
              Icon(
                leadingIcon,
                size: leadingIconSize ?? 24.sp,
                color: (contentOpacity ?? false)
                    ? (leadingIconColor ?? Palette.strydeOrange)
                        .withOpacity(0.5)
                    : (leadingIconColor ?? Palette.strydeOrange),
              ),
              SizedBox(width: 10.w),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 210.w,
                    child: titleLabel.txt(
                      size: titleFontSize ?? 14.sp,
                      fontW: titleFontWeight ?? F.w6,
                      overflow: TextOverflow.ellipsis,
                      color: (contentOpacity ?? false)
                          ? (titleFontColor ??
                                  Theme.of(context).textTheme.bodySmall?.color)
                              ?.withOpacity(0.5)
                          : (titleFontColor ??
                              Theme.of(context).textTheme.bodySmall?.color),
                    ),
                  ),
                  if (subtitleLabel != null) ...[
                    SizedBox(height: 2.h),
                    subtitleLabel!.txt(
                      size: subtitleFontSize ?? 12.sp,
                      fontW: subtitleFontWeight ?? F.w3,
                      color: (contentOpacity ?? false)
                          ? (subtitleFontColor ??
                                  Theme.of(context).textTheme.bodySmall?.color)
                              ?.withOpacity(0.5)
                          : (subtitleFontColor ??
                              Theme.of(context).textTheme.bodySmall?.color),
                    ),
                  ],
                ],
              ),
            ),
            if (interactiveTrailing) ...[
              Opacity(
                opacity: contentOpacity ?? false ? 0.5 : 1.0,
                child: interactiveTrailingWidget ??
                    Icon(
                      PhosphorIconsBold.caretRight,
                      size: 15.h,
                      color: (contentOpacity ?? false)
                          ? Palette.strydeOrange.withOpacity(0.5)
                          : Palette.strydeOrange,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
