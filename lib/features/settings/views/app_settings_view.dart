import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/settings/views/change_password_view.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/shared/app_texts.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';

// Enums for different sections
enum ThemeOptions { option1, option2, option3 }

enum ServiceTypes { option1, option2 }

enum MinimumTripDuration { option1, option2, option3 }

enum MaximumTripDuration { option1, option2, option3 }

enum DriveOptions { option1, option2, option3 }

class AppSettingsView extends ConsumerStatefulWidget {
  const AppSettingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AppSettingsViewState();
}

class _AppSettingsViewState extends ConsumerState<AppSettingsView> {
  final ValueNotifier<ThemeOptions?> _themeOptionsNotifier =
      ValueNotifier<ThemeOptions?>(ThemeOptions.option1);
  final ValueNotifier<bool> _systemDefaultNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<ServiceTypes?> _serviceTypesNotifier =
      ValueNotifier<ServiceTypes?>(null);
  final ValueNotifier<MinimumTripDuration?> _minimumTripDurationNotifier =
      ValueNotifier<MinimumTripDuration?>(null);
  final ValueNotifier<MaximumTripDuration?> _maximumTripDurationNotifier =
      ValueNotifier<MaximumTripDuration?>(null);
  final ValueNotifier<DriveOptions?> _driveOptionsNotifier =
      ValueNotifier<DriveOptions?>(null);
  final ValueNotifier<bool> _pushNotifcationsToggle = false.notifier;
  final ValueNotifier<bool> _cameraPermissionsToggle = false.notifier;
  final ValueNotifier<bool> _locationPermissionsToggle = false.notifier;

  @override
  void dispose() {
    _themeOptionsNotifier.dispose();
    _systemDefaultNotifier.dispose();
    _serviceTypesNotifier.dispose();
    _minimumTripDurationNotifier.dispose();
    _maximumTripDurationNotifier.dispose();
    _driveOptionsNotifier.dispose();
    _pushNotifcationsToggle.dispose();
    _cameraPermissionsToggle.dispose();
    _locationPermissionsToggle.dispose();
    super.dispose();
  }

  final Map<ThemeOptions, String> themeOptionsText = {
    ThemeOptions.option1: "System default",
    ThemeOptions.option2: "Light theme",
    ThemeOptions.option3: "Dark theme",
  };

  final Map<ServiceTypes, String> serviceTypesTexts = {
    ServiceTypes.option1: AppTexts.serviceTypesOption1,
    ServiceTypes.option2: AppTexts.serviceTypesOption2,
  };

  final Map<MinimumTripDuration, String> minimumTripDurationTexts = {
    MinimumTripDuration.option1: AppTexts.minimumTripDurationOption1,
    MinimumTripDuration.option2: AppTexts.minimumTripDurationOption2,
    MinimumTripDuration.option3: AppTexts.minimumTripDurationOption3,
  };

  final Map<MaximumTripDuration, String> maximumTripDurationTexts = {
    MaximumTripDuration.option1: AppTexts.maximumTripDurationOption1,
    MaximumTripDuration.option2: AppTexts.maximumTripDurationOption2,
    MaximumTripDuration.option3: AppTexts.maximumTripDurationOption3,
  };

  final Map<DriveOptions, String> driveOptionsTexts = {
    DriveOptions.option1: AppTexts.driveOptions1,
    DriveOptions.option2: AppTexts.driveOptions2,
    DriveOptions.option3: AppTexts.driveOptions3,
  };

  Widget buildRadioSection<T>(String title, ValueNotifier<T?> notifier,
      List<T> options, Map<T, String> optionTexts) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Container(
        padding: 20.padV,
        decoration: BoxDecoration(
          color: Palette.buttonBG,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 8.0,
              spreadRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: 20.padH,
              child: title.txt(size: 15.sp, fontW: F.w6),
            ),
            for (var option in options)
              SizedBox(
                height: 40.h,
                child: ListTile(
                  contentPadding: 20.padH,
                  title: optionTexts[option]!.txt(size: 12.sp),
                  trailing: ValueListenableBuilder<T?>(
                    valueListenable: notifier,
                    builder: (context, value, child) {
                      return Radio<T>(
                        activeColor: Palette.strydeOrange,
                        value: option,
                        groupValue: value,
                        onChanged: (T? newValue) {
                          notifier.value = newValue;
                        },
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildToggleSection(String title, ValueNotifier<bool> notifier) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Palette.buttonBG,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 8.0,
              spreadRadius: 5.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title.txt(size: 15.sp, fontW: F.w6),
            ValueListenableBuilder<bool>(
              valueListenable: notifier,
              builder: (context, isToggled, child) {
                return FlutterSwitch(
                  padding: 2,
                  height: 26.h,
                  toggleSize: 25.h,
                  width: 45.w,
                  borderRadius: 15.r,
                  activeColor: Palette.strydeOrange,
                  inactiveColor: Palette.greyColor,
                  toggleColor: (Theme.of(context).colorScheme.brightness ==
                          Brightness.dark
                      ? Palette.buttonBG
                      : Palette.greyColor),
                  value: isToggled,
                  onToggle: (newValue) {
                    notifier.value = newValue;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Settings",
          context: context,
          implyLeading: true,
          toolbarHeight: 60.h),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            20.sbH,
            Padding(
              padding: 20.padH,
              child: "Notifications".txt16(fontW: F.w6).alignCenterLeft(),
            ),
            10.sbH,
            buildToggleSection("Allow Notifcations", _pushNotifcationsToggle),
            10.sbH,
            Padding(
              padding: 20.padH,
              child: "Privacy".txt16(fontW: F.w6).alignCenterLeft(),
            ),
            10.sbH,
            buildToggleSection("Camera", _cameraPermissionsToggle),
            buildToggleSection("Location", _locationPermissionsToggle),
            10.sbH,
            Padding(
              padding: 20.padH,
              child: "Themes".txt16(fontW: F.w6).alignCenterLeft(),
            ),
            20.sbH,
            Padding(
              padding: 15.padH,
              child: Container(
                padding: EdgeInsets.only(
                  top: 35.h,
                  left: 15.w,
                  right: 15.w,
                  bottom: 35.h,
                ),
                decoration: BoxDecoration(
                  color: Palette.buttonBG,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 4),
                      blurRadius: 8.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    [_systemDefaultNotifier, _themeOptionsNotifier].syncPro(
                      builder: (context, child) {
                        final isSystemDefaultOn = _systemDefaultNotifier.value;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Icon(PhosphorIconsBold.moon),
                                20.sbH,
                                AppGraphics.darkModePanel.png.myImage(),
                                10.sbH,
                                Radio<ThemeOptions>(
                                  value: ThemeOptions.option3,
                                  groupValue: isSystemDefaultOn
                                      ? ThemeOptions
                                          .option1 // Set groupValue to option1 when system default is on
                                      : _themeOptionsNotifier.value,
                                  onChanged: isSystemDefaultOn
                                      ? null
                                      : (ThemeOptions? value) {
                                          _themeOptionsNotifier.value = value!;
                                          'Selected Theme: Dark Mode'.log();
                                        },
                                ),
                              ],
                            ),
                            60.sbW,
                            Column(
                              children: [
                                const Icon(PhosphorIconsBold.sun),
                                20.sbH,
                                AppGraphics.lightModePanel.png.myImage(),
                                10.sbH,
                                Radio<ThemeOptions>(
                                  value: ThemeOptions.option2,
                                  groupValue: isSystemDefaultOn
                                      ? ThemeOptions
                                          .option1 // Set groupValue to option1 when system default is on
                                      : _themeOptionsNotifier.value,
                                  onChanged: isSystemDefaultOn
                                      ? null
                                      : (ThemeOptions? value) {
                                          _themeOptionsNotifier.value = value!;
                                          'Selected Theme: Light Mode'.log();
                                        },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    20.sbH,
                    _systemDefaultNotifier.sync(
                      builder: (context, isToggled, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "System Default".txt16(fontW: F.w6),
                            FlutterSwitch(
                              padding: 2,
                              height: 26.h,
                              toggleSize: 25.h,
                              width: 45.w,
                              borderRadius: 15.r,
                              activeColor: Palette.strydeOrange,
                              inactiveColor: Palette.greyColor,
                              toggleColor:
                                  (Theme.of(context).colorScheme.brightness ==
                                          Brightness.dark
                                      ? Palette.buttonBG
                                      : Palette.greyColor),
                              value: isToggled,
                              onToggle: (newValue) {
                                _systemDefaultNotifier.value = newValue;
                                if (newValue) {
                                  _themeOptionsNotifier.value =
                                      ThemeOptions.option1;
                                  'System Default Theme Selected'.log();
                                }
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            20.sbH,
            // Padding(
            //   padding: 20.padH,
            //   child: "Configurations".txt16(fontW: F.w6).alignCenterLeft(),
            // ),
            // 10.sbH,
            // buildRadioSection(
            //   AppTexts.minimumTripHeaderText,
            //   _minimumTripDurationNotifier,
            //   MinimumTripDuration.values,
            //   minimumTripDurationTexts,
            // ),
            // buildRadioSection(
            //   AppTexts.maximumTripHeaderText,
            //   _maximumTripDurationNotifier,
            //   MaximumTripDuration.values,
            //   maximumTripDurationTexts,
            // ),
            // buildRadioSection(
            //   AppTexts.driveOptionsHeaderText,
            //   _driveOptionsNotifier,
            //   DriveOptions.values,
            //   driveOptionsTexts,
            // ),
            // buildRadioSection(
            //   AppTexts.serviceTypesHeaderText,
            //   _serviceTypesNotifier,
            //   ServiceTypes.values,
            //   serviceTypesTexts,
            // ),
            Padding(
              padding: 20.padH,
              child: "Security".txt16(fontW: F.w6).alignCenterLeft(),
            ),
            10.sbH,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: Palette.buttonBG,
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 4),
                      blurRadius: 8.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Change Password".txt(size: 15.sp, fontW: F.w6),
                    Icon(
                      PhosphorIconsBold.caretRight,
                      size: 18.h,
                      color: Palette.strydeOrange,
                    )
                  ],
                ),
              ).tap(onTap: () {
                goTo(context: context, view: ChangePasswordView());
              }),
            ),
            50.sbH,
          ],
        ),
      ),
    );
  }
}
