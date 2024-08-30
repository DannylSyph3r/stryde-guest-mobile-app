import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/features/auth/views/create_account_view.dart';
import 'package:stryde_guest_app/features/auth/views/login_view.dart';
import 'package:stryde_guest_app/features/auth/widgets/video_background.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_constants.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/button.dart';
import 'package:stryde_guest_app/utils/widgets/frosted_glass.dart';
import 'package:stryde_guest_app/utils/widgets/vertical_railer.dart';

class ChooseAuthRouteView extends ConsumerWidget {
  const ChooseAuthRouteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          VideoBackground(
            // Use your VideoBackground widget here
            child: FrostedGlass(
              theWidth: width(context),
              theHeight: height(context),
              glassTint: Palette.blackColor.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: VerticalRailer(
              columnPadding: 10.padV,
              middle: AppGraphics.strydeLogo.png.myImage(),
              bottom: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(
                      text: "Sign up",
                      onTap: () {
                        goToAndReplaceUnanimated(
                            context: context, view: CreateAccountView());
                      }),
                  15.sbH,
                  AppButton(
                      color: Palette.buttonBG,
                      text: "Login",
                      onTap: () {
                        goToAndReplaceUnanimated(context: context, view: LoginView());
                      })
                ],
              ),
            ).alignCenter(),
          ),
        ],
      ),
    );
  }
}
