// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';
// import 'package:stryde_mobile_app/shared/app_graphics.dart';
// import 'package:stryde_mobile_app/theme/palette.dart';
// import 'package:stryde_mobile_app/utils/app_extensions.dart';
// import 'package:stryde_mobile_app/utils/snack_bar.dart';
// import 'package:stryde_mobile_app/utils/type_defs.dart';
// import 'package:stryde_mobile_app/utils/widgets/appbar.dart';
// import 'package:stryde_mobile_app/utils/widgets/button.dart';
// import 'package:stryde_mobile_app/utils/widgets/container_list_tile.dart';
// import 'package:stryde_mobile_app/utils/widgets/row_railer.dart';

// class RentalRequestDetailsView extends ConsumerStatefulWidget {
//   const RentalRequestDetailsView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _RentalRequestDetailsViewState();
// }

// class _RentalRequestDetailsViewState
//     extends ConsumerState<RentalRequestDetailsView> {
//   final ValueNotifier<bool> _actionButtonsVisibility = true.notifier;
//   String getDaySuffix(int day) {
//     if (day >= 11 && day <= 13) {
//       return 'th';
//     }
//     switch (day % 10) {
//       case 1:
//         return 'st';
//       case 2:
//         return 'nd';
//       case 3:
//         return 'rd';
//       default:
//         return 'th';
//     }
//   }

//   @override
//   void dispose() {
//     _actionButtonsVisibility.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final calendarDate = ref.watch(calendarDateProvider);
//     // final daySuffix = getDaySuffix(calendarDate.day);
//     // final today = DateTime.now();
//     // final isToday = calendarDate.year == today.year &&
//     //     calendarDate.month == today.month &&
//     //     calendarDate.day == today.day;
//     // final formattedDate = isToday
//     //     ? 'Today'
//     //     : DateFormat('EEEE MMM d').format(calendarDate) + daySuffix;

//     return Scaffold(
//       appBar: customAppBar(
//         title: "Details",
//         context: context,
//         toolbarHeight: 70.h,
//         color: Colors.transparent,
//         isTitleCentered: true,
//       ),
//       body: Padding(
//         padding: 15.padH,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               children: [
//                 10.sbH,
//                 RowRailer(
//                   rowPadding: 0.padH,
//                   leading: Row(
//                     children: [
//                       Container(
//                         height: 60.h,
//                         decoration: BoxDecoration(
//                           color: Palette.buttonBG.withOpacity(0.5),
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Palette.strydeOrange.withOpacity(0.2),
//                               spreadRadius: 2,
//                               blurRadius: 2,
//                             ),
//                           ],
//                         ),
//                         child: Center(
//                             child: AppGraphics.memeoji.png
//                                 .myImage(fit: BoxFit.contain)),
//                       ),
//                       15.sbW,
//                       Expanded(
//                           child: Column(
//                         children: [
//                           Container(
//                             child: "Akinola Daniel Eri-ife"
//                                 .txt16(
//                                     textAlign: TextAlign.left,
//                                     fontW: F.w6,
//                                     overflow: TextOverflow.ellipsis)
//                                 .alignCenterLeft(),
//                           ),
//                           3.sbH,
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               "4.5".txt14(
//                                   textAlign: TextAlign.left, fontW: F.w4),
//                               5.sbW,
//                               Icon(
//                                 PhosphorIconsFill.star,
//                                 size: 15.h,
//                                 color: Palette.strydeOrange,
//                               )
//                             ],
//                           ).alignCenterLeft(),
//                         ],
//                       ))
//                     ],
//                   ),
//                   trailing: Icon(
//                     PhosphorIconsFill.envelope,
//                     size: 30.h,
//                     color: Palette.strydeOrange,
//                   ),
//                 ),
//                 30.sbH,
//                 "Rent info"
//                     .txt18(fontW: F.w6, textAlign: TextAlign.left)
//                     .alignCenterLeft(), // Display the formatted date with suffix
//                 10.sbH,
//                 Container(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
//                   decoration: BoxDecoration(
//                     color: Palette.buttonBG,
//                     borderRadius: BorderRadius.all(Radius.circular(15.r)),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         offset: const Offset(0, 4),
//                         blurRadius: 8.0,
//                         spreadRadius: 5.0,
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       "Lamborghini Aventador"
//                           .txt16(fontW: F.w6, textAlign: TextAlign.left)
//                           .alignCenterLeft(),
//                       5.sbH,
//                       OptionSelectionContainerTile(
//                         horizontalContentPadding: 5.w,
//                         leadingIcon: PhosphorIconsFill.circle,
//                         leadingIconColor: Palette.whiteColor,
//                         leadingIconSize: 15.h,
//                         titleLabel: "Drop-off",
//                         titleFontWeight: F.w6,
//                         subtitleLabel: "9:00 AM",
//                         subtitleFontSize: 14.sp,
//                         interactiveTrailing: true,
//                         interactiveTrailingWidget: "Abuja".txt14(fontW: F.w6),
//                       ),
//                       OptionSelectionContainerTile(
//                         horizontalContentPadding: 5.w,
//                         leadingIcon: PhosphorIconsFill.circle,
//                         leadingIconColor: Palette.strydeOrange,
//                         leadingIconSize: 15.h,
//                         titleLabel: "Pick-up",
//                         titleFontWeight: F.w6,
//                         subtitleLabel: "5:00 PM",
//                         subtitleFontSize: 14.sp,
//                         interactiveTrailing: true,
//                         interactiveTrailingWidget: "Abuja".txt14(fontW: F.w6),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             _actionButtonsVisibility.sync(builder: (context, isVisible, child) {
//               return Visibility(
//                 visible: isVisible,
//                 child: Column(
//                   children: [
//                     AppButton(
//                         text: "Accept",
//                         onTap: () {
//                           showFlushBanner(
//                               context: context,
//                               theMessage: "Rental Request Accepted",
//                               theType: NotificationType.info);
//                           _actionButtonsVisibility.value = false;
//                         }),
//                     20.sbH,
//                     AppButton(
//                       text: "Reject",
//                       color: Palette.buttonBG,
//                       onTap: () {
//                         showFlushBanner(
//                             context: context,
//                             theMessage: "Rental Request Rejected",
//                             theType: NotificationType.info);
//                         _actionButtonsVisibility.value = false;
//                       },
//                     ),
//                     50.sbH
//                   ],
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
