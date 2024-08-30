import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/utils/widgets/list_tile.dart';

class UserProfileView extends ConsumerWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(
        title: "Profile",
        context: context,
        implyLeading: true,
        toolbarHeight: 70.h,
        color: Colors.transparent,
        isTitleCentered: true,
      ),
      body: Padding(
        padding: 15.padH,
        child: Column(
          children: [
            20.sbH,
            Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: Palette.buttonBG.withOpacity(0.5),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Palette.strydeOrange.withOpacity(0.2),
                    spreadRadius: 10,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Center(
                  child: AppGraphics.memeoji.png.myImage(fit: BoxFit.contain)),
            ),
            20.sbH,
            const OptionSelectionListTile(
              interactiveTrailing: true,
              leadingIcon: PhosphorIconsFill.user,
              leadingIconColor: Palette.whiteColor,
              titleLabel: "Name",
              titleFontWeight: F.w6,
              subtitleLabel: "Kizuna Mayuzaki",
            ),
            const OptionSelectionListTile(
              interactiveTrailing: true,
              leadingIcon: PhosphorIconsFill.mapPin,
              leadingIconColor: Palette.whiteColor,
              titleLabel: "Address",
              titleFontWeight: F.w6,
              subtitleLabel: "The Gate of Adonis, Tchalla Memorial Estate, Wakanda",
            ),
            const OptionSelectionListTile(
              interactiveTrailing: true,
              leadingIcon: PhosphorIconsFill.envelope,
              leadingIconColor: Palette.whiteColor,
              titleLabel: "Email",
              titleFontWeight: F.w6,
              subtitleLabel: "kzmayuzaki@gmail.com",
            ),
            const OptionSelectionListTile(
              interactiveTrailing: true,
              leadingIcon: PhosphorIconsFill.phone,
              leadingIconColor: Palette.whiteColor,
              titleLabel: "Phone Number",
              titleFontWeight: F.w6,
              subtitleLabel: "+234 8034567823",
            ),
            const OptionSelectionListTile(
              interactiveTrailing: true,
              leadingIcon: PhosphorIconsFill.identificationCard,
              leadingIconColor: Palette.whiteColor,
              titleLabel: "Proof of ID",
              titleFontWeight: F.w6,
              subtitleLabel: "International Passport",
            ),
          ],
        ),
      ),
    );
  }
}
