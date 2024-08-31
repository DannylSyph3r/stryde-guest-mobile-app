import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/features/search/widgets/slider.dart';
import 'package:stryde_guest_app/shared/app_texts.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/utils/widgets/button.dart';

enum Seats { option1, option2, option3 }

enum DriveOptions { option1, option2 }

enum Transmission { option1, option2 }

class FilterSettingsView extends ConsumerStatefulWidget {
  const FilterSettingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilterSettingsViewState();
}

class _FilterSettingsViewState extends ConsumerState<FilterSettingsView> {
  // Updating to ValueNotifier with a Set for multiple selections
  final ValueNotifier<Set<Seats>> _selectedSeatsNotifier =
      ValueNotifier(<Seats>{});
  final ValueNotifier<Set<DriveOptions>> _selectedDriveOptionsNotifier =
      ValueNotifier(<DriveOptions>{});
  final ValueNotifier<Set<Transmission>> _selectedTransmissionNotifier =
      ValueNotifier(<Transmission>{});

  @override
  void dispose() {
    _selectedSeatsNotifier.dispose();
    _selectedDriveOptionsNotifier.dispose();
    _selectedTransmissionNotifier.dispose();
    super.dispose();
  }

  final Map<Seats, String> seatsOptionsText = {
    Seats.option1: "Four Seats",
    Seats.option2: "Six Seats",
    Seats.option3: "Eight Seats",
  };

  final Map<DriveOptions, String> driveOptionsTexts = {
    DriveOptions.option1: AppTexts.driveOptions1,
    DriveOptions.option2: AppTexts.driveOptions2,
  };

  final Map<Transmission, String> transmissionTypeTexts = {
    Transmission.option1: "Automatic",
    Transmission.option2: "Manual",
  };

  Widget buildCheckboxSection<T>(String title, ValueNotifier<Set<T>> notifier,
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
                child: ValueListenableBuilder<Set<T>>(
                  valueListenable: notifier,
                  builder: (context, selectedValues, child) {
                    final isSelected = selectedValues.contains(option);
                    return CheckboxListTile(
                      contentPadding: 20.padH,
                      title: optionTexts[option]!.txt(size: 12.sp),
                      value: isSelected,
                      onChanged: (bool? value) {
                        final updatedSelectedItems =
                            Set<T>.from(selectedValues);
                        if (value == true) {
                          updatedSelectedItems.add(option);
                        } else {
                          updatedSelectedItems.remove(option);
                        }
                        notifier.value = updatedSelectedItems;
                      },
                      activeColor: Palette.strydeOrange,
                    );
                  },
                ),
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
        title: "Filters",
        context: context,
        toolbarHeight: 70.h,
        color: Colors.transparent,
        isTitleCentered: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: 15.padH,
                child: "Price"
                    .txt18(fontW: F.w6, textAlign: TextAlign.left)
                    .alignCenterLeft(),
              ),
              FilterSlider(
                min: 0,
                max: 100,
                divisions: 4,
                labels: {
                  0: "₦20,000",
                  25: "₦250,000",
                  50: "₦500,000",
                  75: "₦750,000",
                  100: "₦1,000,000",
                },
                initialValue: 0,
              ),
              20.sbH,
              Padding(
                padding: 15.padH,
                child: "Ratings"
                    .txt18(fontW: F.w6, textAlign: TextAlign.left)
                    .alignCenterLeft(),
              ),
              FilterSlider(
                iconInLabel: true,
                min: 0,
                max: 100,
                divisions: 4,
                labels: {
                  0: "1.0",
                  25: "2.0",
                  50: "3.0",
                  75: "4.0",
                  100: "5.0",
                },
                initialValue: 0,
              ),
              20.sbH,
              Padding(
                padding: 15.padH,
                child: "Specifications"
                    .txt18(fontW: F.w6, textAlign: TextAlign.left)
                    .alignCenterLeft(),
              ),
              10.sbH,
              buildCheckboxSection(
                "Seats",
                _selectedSeatsNotifier,
                Seats.values,
                seatsOptionsText,
              ),
              buildCheckboxSection(
                "Drive Options",
                _selectedDriveOptionsNotifier,
                DriveOptions.values,
                driveOptionsTexts,
              ),
              buildCheckboxSection(
                "Transmission",
                _selectedTransmissionNotifier,
                Transmission.values,
                transmissionTypeTexts,
              ),
              50.sbH,
              AppButton(text: "Save", onTap: () {}),
              50.sbH,
            ],
          ),
        ],
      ),
    );
  }
}
