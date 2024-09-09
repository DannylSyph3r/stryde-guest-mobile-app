import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/calendar/providers/calendar_providers.dart';
import 'package:stryde_guest_app/features/vehicles/views/rental_request_confirmation_view.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/utils/widgets/button.dart';

enum CardOptions { option1, option2 }

class RentalSummaryView extends ConsumerStatefulWidget {
  final String vehicleManufacturerName;
  final String vehicleModelName;
  final String exchangeLocation;
  final String daysDuration;
  final DateTime pickUpDate;
  final DateTime dropOffDate;
  final TimeOfDay pickupTime;
  final TimeOfDay dropOffTime;
  const RentalSummaryView(
      {required this.vehicleManufacturerName,
      required this.vehicleModelName,
      required this.exchangeLocation,
      required this.daysDuration,
      required this.pickUpDate,
      required this.dropOffDate,
      required this.pickupTime,
      required this.dropOffTime,
      super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RentalSummaryViewState();
}

class _RentalSummaryViewState extends ConsumerState<RentalSummaryView> {
  final ValueNotifier<CardOptions?> _cardOptionsNotifier =
      ValueNotifier<CardOptions?>(CardOptions.option1);

  final List<Map<String, dynamic>> cardOptions = [
    {
      'icon': AppGraphics.visaCardIcon,
      'text': "Visa xxx-676",
      'option': CardOptions.option1
    },
    {
      'icon': AppGraphics.verveCardIcon,
      'text': "Verve xxx-676",
      'option': CardOptions.option2
    },
  ];

  @override
  void dispose() {
    _cardOptionsNotifier.dispose();
    super.dispose();
  }

  Widget buildRadioSection(ValueNotifier<CardOptions?> notifier,
      List<Map<String, dynamic>> cardOptions) {
    return Container(
      padding: 10.padV,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var cardOption in cardOptions)
            SizedBox(
              height: 40.h,
              child: ListTile(
                contentPadding: 15.padH,
                leading: (cardOption['icon'] as String)
                    .iconPng
                    .myImage(width: 35.h, fit: BoxFit.contain),
                title: (cardOption['text'] as String)
                    .txt(size: 14.sp, textAlign: TextAlign.left),
                trailing: ValueListenableBuilder<CardOptions?>(
                  valueListenable: notifier,
                  builder: (context, value, child) {
                    return Radio<CardOptions>(
                      activeColor: Palette.strydeOrange,
                      value: cardOption['option'] as CardOptions,
                      groupValue: value,
                      onChanged: (CardOptions? newValue) {
                        notifier.value = newValue;
                      },
                    );
                  },
                ),
              ),
            ),
          ListTile(
            contentPadding: 15.padH,
            leading: SizedBox(
              width: 35.h,
              child: Icon(
                PhosphorIconsBold.plus,
                size: 24.h,
                color: Palette.whiteColor,
              ),
            ),
            title: "Add new card".txt(size: 14.sp),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Summary",
        context: context,
        color: Colors.transparent,
        isTitleCentered: true,
      ),
      body: ListView(
        padding: 15.padH,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                SizedBox(
                  width: 140.h,
                  height: 140.h,
                  child: Center(
                      child:
                          AppGraphics.carPlOne.png.myImage(fit: BoxFit.cover)),
                ),
                20.sbW,
                Expanded(
                    child: Column(
                  children: [
                    "Mizukake Tsynami"
                        .txt16(
                            textAlign: TextAlign.left,
                            fontW: F.w6,
                            overflow: TextOverflow.ellipsis)
                        .alignCenterLeft(),
                    3.sbH,
                    "G-Class"
                        .txt14(textAlign: TextAlign.left)
                        .alignCenterLeft(),
                    20.sbH,
                    "₦250,000"
                        .txt14(textAlign: TextAlign.left, fontW: F.w6)
                        .alignCenterLeft()
                  ],
                )),
              ]),
              30.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      "Pick-up Date".txt16(fontW: F.w6),
                      5.sbH,
                      "${DateFormat('d MMMM, yyyy').format(widget.pickUpDate)}, ${widget.pickupTime.format(context)} "
                          .txt14()
                    ],
                  ),
                  "Edit".txt14(fontW: F.w6).tap(onTap: () {
                    ref.read(pickupDateProvider.notifier).state = null;
                    ref.read(dropoffDateProvider.notifier).state = null;
                    ref.read(pickupTimeProvider.notifier).state =
                        const TimeOfDay(hour: 0, minute: 0);
                    ref.read(dropoffTimeProvider.notifier).state =
                        const TimeOfDay(hour: 12, minute: 59);
                    goBack(context);
                  })
                ],
              ),
              20.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      "Drop-off Date".txt16(fontW: F.w6),
                      5.sbH,
                      "${DateFormat('d MMMM, yyyy').format(widget.dropOffDate)}, ${widget.dropOffTime.format(context)} "
                          .txt14()
                    ],
                  ),
                  "Edit".txt14(fontW: F.w6).tap(onTap: () {
                    ref.read(pickupDateProvider.notifier).state = null;
                    ref.read(dropoffDateProvider.notifier).state = null;
                    ref.read(pickupTimeProvider.notifier).state =
                        const TimeOfDay(hour: 0, minute: 0);
                    ref.read(dropoffTimeProvider.notifier).state =
                        const TimeOfDay(hour: 12, minute: 59);
                    goBack(context);
                  })
                ],
              ),
              40.sbH,
              "Payment Method".txt16(fontW: F.w6),
              10.sbH,
              buildRadioSection(_cardOptionsNotifier, cardOptions),
              100.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["Price".txt14(), "₦250,000".txt14()],
              ),
              10.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["Duration".txt14(), widget.daysDuration.txt14()],
              ),
              10.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Total".txt14(fontW: F.w6),
                  "₦750,000".txt14(fontW: F.w6)
                ],
              ),
              30.sbH,
              AppButton(
                  text: "Pay Total",
                  onTap: () {
                    goTo(
                        context: context,
                        view: RentalRequestConfirmationView());
                  }).alignCenter(),
              50.sbH
            ],
          ),
        ],
      ),
    );
  }
}
