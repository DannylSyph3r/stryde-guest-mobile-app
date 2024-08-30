import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/widgets/list_tile.dart';

class OptionsModal extends StatelessWidget {
  final List<String> selectionOptions;
  final List<IconData>? leadingIcons;
  final double? titleFontSize;
  final Color? titleFontColor;
  final Color? leadingIconColor;
  final void Function(int index)? onOptionTap;
  final double modalHeight;
  final double listViewHeight;

  const OptionsModal(
      {required this.selectionOptions,
      this.leadingIcons,
      this.titleFontSize,
      this.titleFontColor,
      this.leadingIconColor,
      this.onOptionTap,
      required this.modalHeight,
      required this.listViewHeight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: modalHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Palette.darkBG, // Adjust to your color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              width: 60.w,
              height: 4.h,
              decoration: ShapeDecoration(
                color: Palette.strydeOrange, // Adjust to your color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            OptionsList(
              selectionOptions: selectionOptions,
              leadingIcons: leadingIcons,
              titleFontSize: titleFontSize,
              titleFontColor: titleFontColor,
              leadingIconColor: leadingIconColor,
              onOptionTap: onOptionTap,
              listViewHeight: listViewHeight,
            ),
          ],
        ),
      ),
    );
  }
}

class OptionsList extends StatelessWidget {
  final List<String> selectionOptions;
  final List<IconData>? leadingIcons;
  final double? titleFontSize;
  final Color? titleFontColor;
  final Color? leadingIconColor;
  final void Function(int index)? onOptionTap;
  final double listViewHeight;

  const OptionsList(
      {required this.selectionOptions,
      this.leadingIcons,
      this.titleFontSize,
      this.titleFontColor,
      this.leadingIconColor,
      this.onOptionTap,
      required this.listViewHeight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listViewHeight,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: selectionOptions.length,
        itemBuilder: (context, index) {
          final String option = selectionOptions[index];
          final IconData? leadingIcon =
              leadingIcons != null && leadingIcons!.length > index
                  ? leadingIcons![index]
                  : null;

          return OptionSelectionListTile(
            leadingIcon: leadingIcon,
            titleLabel: option,
            titleFontSize: titleFontSize,
            titleFontColor: titleFontColor,
            leadingIconColor: leadingIconColor,
            interactiveTrailing: false,
            onTileTap: () {
              if (onOptionTap != null) {
                onOptionTap!(index);
              }
            },
          );
        },
      ),
    );
  }
}

void showOptionsModal(
  BuildContext context, {
  required List<String> selectionOptions,
  List<IconData>? leadingIcons,
  double? titleFontSize,
  Color? titleFontColor,
  Color? leadingIconColor,
  void Function(int index)? onOptionTap,
  required double modalHeight,
  required double listViewHeight,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => OptionsModal(
      selectionOptions: selectionOptions,
      leadingIcons: leadingIcons,
      titleFontSize: titleFontSize,
      titleFontColor: titleFontColor,
      leadingIconColor: leadingIconColor,
      onOptionTap: onOptionTap,
      modalHeight: modalHeight,
      listViewHeight: listViewHeight,
    ),
  );
}
