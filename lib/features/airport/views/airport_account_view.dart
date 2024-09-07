import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/airport/views/airport_trips_view.dart';
import 'package:stryde_guest_app/features/home/views/user_profile_view.dart';
import 'package:stryde_guest_app/features/settings/views/app_settings_view.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/list_tile.dart';
import 'package:stryde_guest_app/utils/widgets/row_railer.dart';

class AirportAccountView extends ConsumerWidget {
  const AirportAccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          AppGraphics.eclipse.png.myImage(),
          Padding(
            padding: 15.padH,
            child: Column(
              children: [
                60.sbH,
                RowRailer(
                    leading:
                        const Icon(PhosphorIconsBold.arrowLeft).tap(onTap: () {
                      goBack(context);
                    }),
                    trailing: const Icon(PhosphorIconsFill.gear).tap(onTap: () {
                      goTo(context: context, view: AppSettingsView());
                    }),
                    rowPadding: 0.padH),
                40.sbH,
                Row(children: [
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Palette.buttonBG.withOpacity(0.5),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Palette.strydeOrange.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                        child: AppGraphics.memeoji.png
                            .myImage(fit: BoxFit.contain)),
                  ),
                  15.sbW,
                  Expanded(
                      child: Column(
                    children: [
                      "Akinola Daniel Eri-ife"
                          .txt16(
                              textAlign: TextAlign.left,
                              fontW: F.w6,
                              overflow: TextOverflow.ellipsis)
                          .alignCenterLeft(),
                      5.sbH,
                      Container(
                        height: 35.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            color: Palette.buttonBG,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                PhosphorIconsFill.medal,
                                size: 23.h,
                                color: Palette.strydeOrange,
                              ),
                              5.sbW,
                              "Tier 1".txt14(
                                  textAlign: TextAlign.left, fontW: F.w4),
                            ]),
                      ).alignCenterLeft()
                    ],
                  )),
                  Container(
                    decoration: BoxDecoration(
                        color: Palette.buttonBG.withOpacity(0.5),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: 5.0.padA,
                      child: Icon(
                        PhosphorIconsBold.caretRight,
                        size: 25.h,
                        color: Palette.strydeOrange,
                      ),
                    ),
                  ).tap(onTap: () {
                    goTo(context: context, view: UserProfileView());
                  }),
                ]),
                70.sbH,
                OptionSelectionListTile(
                  interactiveTrailing: false,
                  leadingIcon: PhosphorIconsFill.wallet,
                  leadingIconColor: Palette.whiteColor,
                  titleLabel: "Payment",
                  titleFontWeight: F.w6,
                  onTileTap: () {},
                ),
                OptionSelectionListTile(
                  interactiveTrailing: false,
                  leadingIcon: PhosphorIconsFill.lineSegments,
                  leadingIconColor: Palette.whiteColor,
                  titleLabel: "Trips",
                  titleFontWeight: F.w6,
                  onTileTap: () {
                    goTo(context: context, view: AirportTripsView());
                  },
                ),
                const OptionSelectionListTile(
                  interactiveTrailing: false,
                  leadingIcon: PhosphorIconsFill.question,
                  leadingIconColor: Palette.whiteColor,
                  titleLabel: "Help",
                  titleFontWeight: F.w6,
                  subtitleLabel: "Contact us, About Stryde, Terms of service",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
