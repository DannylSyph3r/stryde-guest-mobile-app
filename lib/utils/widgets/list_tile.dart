import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class OptionSelectionListTile extends StatelessWidget {
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
  final Color? leadingIconColor;
  final Color? titleFontColor;
  final Color? subtitleFontColor;
  final Widget? interactiveTrailingWidget;
  final void Function()? onTileTap;
  const OptionSelectionListTile(
      {super.key,
      this.horizontalContentPadding,
      required this.interactiveTrailing,
      this.isThreeLines = false,
      this.interactiveTrailingWidget,
      this.leadingIconSize,
      this.leadingIcon,
      this.leadingIconColor,
      this.titleFontColor,
      this.subtitleFontColor,
      this.subtitleLabel,
      required this.titleLabel,
      this.titleFontSize,
      this.titleFontWeight,
      this.subtitleFontSize,
      this.subtitleFontWeight,
      this.onTileTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTileTap,
        contentPadding: EdgeInsets.symmetric(
            vertical: 0.h, horizontal: horizontalContentPadding ?? 10.w),
        isThreeLine: isThreeLines ?? false,
        minVerticalPadding: 10.h,
        minLeadingWidth: 5.w,
        subtitle: subtitleLabel?.txt(
            size: subtitleFontSize ?? 12.sp,
            fontW: subtitleFontWeight ?? F.w3,
            overflow: TextOverflow.ellipsis,
            color: subtitleFontColor ??
                Theme.of(context).textTheme.bodySmall?.color),
        leading: leadingIcon != null
            ? Icon(
                leadingIcon,
                size: leadingIconSize ?? 24.sp,
                color: leadingIconColor ?? Palette.strydeOrange,
              )
            : const SizedBox.shrink(),
        title: Container(
            padding:
                subtitleLabel != null ? EdgeInsets.only(bottom: 0.h) : 0.0.padA,
            child: titleLabel.txt(
                size: titleFontSize ?? 16.sp,
                fontW: titleFontWeight ?? F.w3,
                overflow: TextOverflow.ellipsis,
                color: titleFontColor ??
                    Theme.of(context).textTheme.bodySmall?.color)),
        trailing: interactiveTrailing == false
            ? Icon(
                PhosphorIconsBold.caretRight,
                size: 15.h,
                color: Palette.strydeOrange,
              )
            : interactiveTrailingWidget ?? const SizedBox.shrink());
  }
}
