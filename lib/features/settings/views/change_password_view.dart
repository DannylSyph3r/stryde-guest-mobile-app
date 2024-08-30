import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/shared/app_texts.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/utils/widgets/button.dart';
import 'package:stryde_guest_app/utils/widgets/text_input.dart';

class ChangePasswordView extends ConsumerStatefulWidget {
  const ChangePasswordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangePasswordViewState();
}

class _ChangePasswordViewState extends ConsumerState<ChangePasswordView> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final ValueNotifier _passwordVisible = false.notifier;
  final ValueNotifier _newPasswordVisible = false.notifier;
  final ValueNotifier _confirmNewPasswordVisible = false.notifier;

  void passwordVisibility() => _passwordVisible.value = !_passwordVisible.value;
  void newPasswordVisibility() =>
      _newPasswordVisible.value = !_newPasswordVisible.value;
  void confirmNewPasswordVisibility() =>
      _confirmNewPasswordVisible.value = !_confirmNewPasswordVisible.value;

  @override
  void dispose() {
    _passwordController.dispose();
    _newpasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Password Reset",
          context: context,
          implyLeading: true,
          toolbarHeight: 60.h),
      body: Padding(
        padding: 15.padH,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  20.sbH,
                  "Create a strong password to secure your account"
                      .txt12()
                      .alignCenter(),
                  20.sbH,
                  _passwordVisible.sync(
                      builder: (context, passwordVisible, child) {
                    return TextInputWidget(
                      hintText: "Enter Password",
                      controller: _passwordController,
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
                    );
                  }),
                  15.sbH,
                  _newPasswordVisible.sync(
                      builder: (context, newPasswordVisible, child) {
                    return TextInputWidget(
                        hintText: "New Password",
                        controller: _newpasswordController,
                        obscuretext: !_newPasswordVisible.value,
                        suffixIcon: Padding(
                            padding: 15.padH,
                            child: Icon(
                              newPasswordVisible
                                  ? PhosphorIconsBold.eyeSlash
                                  : PhosphorIconsBold.eye,
                              size: 20.h,
                              color: _newPasswordVisible.value == false
                                  ? Palette.strydeOrange
                                  : Palette.whiteColor,
                            )).tap(onTap: () {
                          newPasswordVisibility();
                        }));
                  }),
                  15.sbH,
                  _confirmNewPasswordVisible.sync(
                      builder: (context, confirmNewPasswordVisible, child) {
                    return TextInputWidget(
                        hintText: "Confirm Password",
                        controller: _confirmNewPasswordController,
                        obscuretext: !_confirmNewPasswordVisible.value,
                        suffixIcon: Padding(
                            padding: 15.padH,
                            child: Icon(
                              confirmNewPasswordVisible
                                  ? PhosphorIconsBold.eyeSlash
                                  : PhosphorIconsBold.eye,
                              size: 20.h,
                              color: _confirmNewPasswordVisible.value == false
                                  ? Palette.strydeOrange
                                  : Palette.whiteColor,
                            )).tap(onTap: () {
                          confirmNewPasswordVisibility();
                        }));
                  }),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
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
                          // recognizer: TapGestureRecognizer()..onTap = () {},
                          text: AppTexts.tOS,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Palette.strydeOrange,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        TextSpan(
                          // recognizer: TapGestureRecognizer()..onTap = () {},
                          text: AppTexts.tOSBody,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        TextSpan(
                          // recognizer: TapGestureRecognizer()..onTap = () {},
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
                  30.sbH,
                  AppButton(text: "Change Password", onTap: () {}),
                  50.sbH
                ],
              )
            ]),
      ),
    );
  }
}
