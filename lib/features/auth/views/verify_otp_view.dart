import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/features/auth/providers/auth_providers.dart';
import 'package:stryde_guest_app/features/auth/views/set_password_view.dart';
import 'package:stryde_guest_app/shared/app_texts.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/keyboard_utils.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/utils/widgets/pin_input_box.dart';

class VerifyOTPView extends ConsumerStatefulWidget {
  const VerifyOTPView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyOTPViewState();
}

class _VerifyOTPViewState extends ConsumerState<VerifyOTPView> {
  final TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authSelection = ref.watch(signupTabStateProvider.notifier);
    return Scaffold(
      appBar: customAppBar(
        title: "Create Account",
        context: context,
        toolbarHeight: 70.h,
        color: Colors.transparent,
        isTitleCentered: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        10.sbH,
        "Enter OTP".txt18().alignCenter(),
        20.sbH,
        authSelection.state == 0
            ? AppTexts.oTPTextMail
                .txt14(textAlign: TextAlign.center)
                .alignCenter()
            : AppTexts.oTPTextPhone
                .txt14(textAlign: TextAlign.center)
                .alignCenter(),
        30.sbH,
        Padding(
          padding: 70.padH,
          child: PinInputBox(
            controller: _pinController,
            onCompleted: (String val) {
              val.log();
              dropKeyboard(context);
              Future.delayed(500.milliseconds, () {
                goTo(context: context, view: const SetPasswordView());
              });
            },
          ),
        ),
        20.sbH,
        AppTexts.resendOTP.txt16(color: Palette.strydeOrange, fontW: F.w6)
      ]),
    );
  }
}
