import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stryde_guest_app/features/auth/providers/auth_providers.dart';
import 'package:stryde_guest_app/features/auth/views/login_view.dart';
import 'package:stryde_guest_app/features/auth/views/verify_otp_view.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/shared/app_texts.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/button.dart';
import 'package:stryde_guest_app/utils/widgets/text_input.dart';

class CreateAccountView extends ConsumerStatefulWidget {
  const CreateAccountView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateAccountViewState();
}

class _CreateAccountViewState extends ConsumerState<CreateAccountView>
    with SingleTickerProviderStateMixin {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.watch(signupTabStateProvider);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: 20.0.padV,
          child: Column(children: [
            80.sbH,
            Padding(
              padding: 15.padH,
              child: "Create Account".txt24(fontW: F.w6).alignCenterLeft(),
            ),
            Column(
              children: [
                30.sbH,
                Padding(
                  padding: 15.padH,
                  child: TextInputWidget(
                      hintText: "Firstname", controller: _firstNameController),
                ),
                10.sbH,
                Padding(
                  padding: 15.padH,
                  child: TextInputWidget(
                      hintText: "Lastname", controller: _lastNameController),
                ),
                10.sbH,
                Padding(
                  padding: 15.padH,
                  child: TextInputWidget(
                      hintText: "Email", controller: _emailController),
                )
              ],
            ),
            10.sbH,
            "or sign up with".txt(size: 17.sp, color: Palette.whiteColor),
            20.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 47.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                      color: Palette.buttonBG,
                      borderRadius: BorderRadius.all(Radius.circular(21.r))),
                  child: Center(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppGraphics.googleIcon.iconSvg,
                          height: 27.h,
                        ),
                        10.sbW,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            3.sbH,
                            "Google".txt14(fontW: F.w6),
                          ],
                        )
                      ],
                    ),
                  )),
                ),
              ],
            ),
            20.sbH,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: AppTexts.alreadyHaveAccount,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        goToAndReplace(
                            context: context, view: const LoginView());
                      },
                    text: AppTexts.login,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Palette.strydeOrange,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            200.sbH,
            Padding(
              padding: 15.padH,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: AppTexts.tOSOpener,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          goToAndReplace(
                              context: context, view: const LoginView());
                        },
                      text: AppTexts.tOS,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Palette.strydeOrange,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          goToAndReplace(
                              context: context, view: const LoginView());
                        },
                      text: AppTexts.tOSBody,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          goToAndReplace(
                              context: context, view: const LoginView());
                        },
                      text: AppTexts.privacyPolicy,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Palette.strydeOrange,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            50.sbH,
            AppButton(
                text: "Continue",
                onTap: () {
                  goTo(context: context, view: VerifyOTPView());
                }),
            50.sbH,
          ]),
        ),
      ),
    );
  }
}
