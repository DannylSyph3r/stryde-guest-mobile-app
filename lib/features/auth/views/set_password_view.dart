import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/base_nav/wrapper/base_nav_wrapper.dart';
import 'package:stryde_guest_app/shared/app_texts.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/utils/widgets/button.dart';
import 'package:stryde_guest_app/utils/widgets/text_input.dart';

class SetPasswordView extends ConsumerStatefulWidget {
  const SetPasswordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SetPasswordViewState();
}

class _SetPasswordViewState extends ConsumerState<SetPasswordView> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final ValueNotifier _passwordVisible = false.notifier;
  final ValueNotifier _confirmPasswordVisible = false.notifier;

  void passwordVisibility() => _passwordVisible.value = !_passwordVisible.value;
  void confirmPasswordVisibility() =>
      _confirmPasswordVisible.value = !_confirmPasswordVisible.value;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordVisible.dispose();
    _confirmPasswordVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            title: "Create Account",
            context: context,
            toolbarHeight: 70.h,
            color: Colors.transparent,
            isTitleCentered: true),
        body: Padding(
          padding: 15.padH,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    10.sbH,
                    AppTexts.setPassword
                        .txt16(textAlign: TextAlign.center)
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
                    _confirmPasswordVisible.sync(
                        builder: (context, confirmPasswordVisible, child) {
                      return TextInputWidget(
                          hintText: "Confirm Password",
                          controller: _confirmPasswordController,
                          obscuretext: !_confirmPasswordVisible.value,
                          suffixIcon: Padding(
                              padding: 15.padH,
                              child: Icon(
                                confirmPasswordVisible
                                    ? PhosphorIconsBold.eyeSlash
                                    : PhosphorIconsBold.eye,
                                size: 20.h,
                                color: _confirmPasswordVisible.value == false
                                    ? Palette.strydeOrange
                                    : Palette.whiteColor,
                              )).tap(onTap: () {
                            confirmPasswordVisibility();
                          }));
                    }),
                  ],
                ),
                Column(
                  children: [
                    AppButton(
                        text: "Sign up",
                        onTap: () {
                          goToAndReplace(
                              context: context, view: BaseNavWrapper());
                        }),
                    50.sbH
                  ],
                )
              ]),
        ));
  }
}
