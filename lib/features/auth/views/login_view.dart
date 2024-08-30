import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/auth/views/create_account_view.dart';
import 'package:stryde_guest_app/features/base_nav/wrapper/base_nav_wrapper.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/shared/app_texts.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/button.dart';
import 'package:stryde_guest_app/utils/widgets/text_input.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _phoneNumberPasswordController =
      TextEditingController();
  final ValueNotifier _passwordVisible = false.notifier;

  void passwordVisibility() => _passwordVisible.value = !_passwordVisible.value;

  @override
  void dispose() {
    _emailController.dispose();
    _emailPasswordController.dispose();
    _phoneNumberController.dispose();
    _phoneNumberPasswordController.dispose();
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
              child: "Login".txt24(fontW: F.w6).alignCenterLeft(),
            ),
            15.sbH,
            Column(
              children: [
                SizedBox(
                  height: 170.h,
                  child: Column(
                    children: [
                      20.sbH,
                      Padding(
                        padding: 15.padH,
                        child: TextInputWidget(
                            hintText: "Email", controller: _emailController),
                      ),
                      10.sbH,
                      _passwordVisible.sync(
                          builder: (context, passwordVisible, child) {
                        return Padding(
                          padding: 15.padH,
                          child: TextInputWidget(
                            hintText: "Password",
                            controller: _emailPasswordController,
                            obscuretext: !_passwordVisible.value,
                            suffixIcon: Padding(
                                padding: 15.padH,
                                child: Icon(
                                  passwordVisible
                                      ? PhosphorIconsBold.eyeSlash
                                      : PhosphorIconsBold.eye,
                                  size: 20.h,
                                  color: _passwordVisible.value == false
                                      ? Palette.strydeOrange
                                      : Palette.whiteColor,
                                )).tap(onTap: () {
                              passwordVisibility();
                            }),
                          ),
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
            10.sbH,
            "or login with".txt(size: 17.sp, color: Palette.whiteColor),
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
            AppTexts.forgotPassword
                .txt(size: 15.sp, color: Palette.strydeOrange),
            20.sbH,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: AppTexts.noAccount,
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
                            context: context, view: const CreateAccountView());
                      },
                    text: AppTexts.signUp,
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
            170.sbH,
            AppButton(
                text: "Login",
                onTap: () {
                  goToAndReplace(context: context, view: BaseNavWrapper());
                })
          ]),
        ),
      ),
    );
  }
}
