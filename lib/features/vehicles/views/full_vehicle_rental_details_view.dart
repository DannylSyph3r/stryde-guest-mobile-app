import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stryde_guest_app/features/calendar/views/calendar_view.dart';
import 'package:stryde_guest_app/features/reviews/widgets/review_card.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/vehicle_specs_tab.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/shared/app_texts.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/utils/widgets/row_railer.dart';

class FullVehicleRentalDetailsView extends ConsumerStatefulWidget {
  const FullVehicleRentalDetailsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FullVehicleRentalDetailsViewState();
}

class _FullVehicleRentalDetailsViewState
    extends ConsumerState<FullVehicleRentalDetailsView> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  // Define the list of vehicle specifications
  final List<Map<String, dynamic>> vehicleSpecs = [
    {'icon': PhosphorIconsFill.carProfile, 'label': 'SUV'},
    {'icon': PhosphorIconsFill.gasPump, 'label': 'Petrol'},
    {'icon': PhosphorIconsFill.gear, 'label': 'Automatic'},
    {'icon': PhosphorIconsFill.paintBucket, 'label': 'Red & White'},
    {'icon': PhosphorIconsFill.seat, 'label': '4 Seats'},
    {'icon': PhosphorIconsFill.steeringWheel, 'label': 'Driver & Self Driven'},
  ];

  final List<Map<String, dynamic>> vehicleFeatures = [
    {'icon': PhosphorIconsBold.bluetooth, 'label': 'Bluetooth connectivity'},
    {'icon': PhosphorIconsBold.mapTrifold, 'label': 'GPS navigation'},
    {'icon': PhosphorIconsFill.videoCamera, 'label': 'Backup camera'},
    {'icon': PhosphorIconsFill.doorOpen, 'label': 'Keyless entry'},
    {'icon': PhosphorIconsFill.monitor, 'label': 'Touchscreen display'},
    {'icon': PhosphorIconsFill.sun, 'label': 'Climate control'},
    {'icon': PhosphorIconsFill.lightbulb, 'label': 'LED lighting'},
    {'icon': PhosphorIconsFill.speedometer, 'label': 'Cruise control'},
    {'icon': PhosphorIconsFill.scales, 'label': 'Stability control'},
    {'icon': PhosphorIconsFill.seat, 'label': 'Leather seats'},
    {'icon': PhosphorIconsFill.tire, 'label': 'Tire pressure warning'},
  ];

  // final List<Map<String, dynamic>> optionSelections = [
  //   {'icon': PhosphorIconsBold.trash, 'label': 'Remove Vehicle'},
  //   {'icon': PhosphorIconsFill.flagBanner, 'label': 'Flag Unavailabale'},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          title: "Mercedes Benz",
          context: context,
          toolbarHeight: 70.h,
          color: Colors.transparent,
          isTitleCentered: true,
          actions: [
            Padding(
              padding: 20.padH,
              child: Container(
                height: 40.h,
                width: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.greyColor.withOpacity(0.6),
                ),
                child: Icon(
                  PhosphorIconsFill.heartStraight,
                  color: Palette.strydeOrange,
                  size: 25.h,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          padding: 0.padV,
          children: [
            "G-Class"
                .txt16(color: Palette.strydeOrange, textAlign: TextAlign.center)
                .alignCenter(),
            15.sbH,
            Padding(
              padding: 15.padH,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: Stack(
                  children: [
                    FlutterCarousel(
                      items: List.generate(
                        4,
                        (index) => AppGraphics.carPlOne.png.myImage(
                          fit: BoxFit.cover,
                          height: 230.h,
                          width: double.infinity,
                        ),
                      ),
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        viewportFraction: 1.0,
                        initialPage: 2,
                        showIndicator: false,
                        height: 230.h,
                        onPageChanged:
                            (int index, CarouselPageChangedReason reason) {
                          _currentIndexNotifier.value = index;
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ValueListenableBuilder<int>(
                          valueListenable: _currentIndexNotifier,
                          builder: (context, currentIndex, _) {
                            return SmoothPageIndicator(
                              controller:
                                  PageController(initialPage: currentIndex),
                              count: 4,
                              effect: CustomizableEffect(
                                activeDotDecoration: DotDecoration(
                                  width: 15.w,
                                  height: 8.h,
                                  color: Palette.strydeOrange,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                dotDecoration: DotDecoration(
                                  width: 8.w,
                                  height: 8.h,
                                  color: Palette.whiteColor.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                spacing: 5.w,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.sbH,
            RowRailer(
                rowPadding: 15.padH,
                leading: Row(
                  children: [
                    Icon(
                      PhosphorIconsFill.mapPin,
                      color: Palette.strydeOrange,
                      size: 18.h,
                    ),
                    5.sbW,
                    "Abuja"
                        .txt14(
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left)
                        .alignCenterLeft(),
                  ],
                ),
                trailing: const SizedBox.shrink()),
            10.sbH,
            RowRailer(
              rowPadding: 15.padH,
              leading: Row(children: [
                RatingBar.builder(
                  itemSize: 14.w,
                  initialRating: 3.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: 1.padH,
                  unratedColor: Colors.grey.withOpacity(0.8),
                  itemBuilder: (context, _) => Icon(
                    PhosphorIconsFill.star,
                    color: Palette.strydeOrange,
                    size: 14.sp,
                  ),
                  onRatingUpdate: (rating) {
                    rating.log();
                  },
                ),
                5.sbW,
                "(100)".txt14(),
              ]),
              trailing:
                  "SNK-123XZ".txt14(fontW: F.w6, color: Palette.strydeOrange),
            ),
            30.sbH,
            Padding(
              padding: 15.padH,
              child: Row(
                children: [
                  "Specs & Features".txt18(fontW: F.w6),
                  15.sbW,
                  Expanded(
                    child: Container(
                      height: 1.h,
                      color: Palette.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            20.sbH,

            // ListView.builder for vehicle specifications
            SizedBox(
              height: 50.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: vehicleSpecs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: 7.5.padH, // Add some padding if necessary
                    child: VehicleSpecificationsTab(
                      tabIcon: vehicleSpecs[index]['icon'] as IconData,
                      tabLabel: vehicleSpecs[index]['label'] as String,
                    ),
                  );
                },
              ),
            ),
            25.sbH,
            SizedBox(
              height: 50.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: vehicleFeatures.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: 7.5.padH, // Add some padding if necessary
                    child: VehicleSpecificationsTab(
                      tabIcon: vehicleFeatures[index]['icon'] as IconData,
                      tabLabel: vehicleFeatures[index]['label'] as String,
                    ),
                  );
                },
              ),
            ),

            30.sbH,
            Padding(
              padding: 15.padH,
              child: Row(
                children: [
                  "Description".txt18(fontW: F.w6),
                  15.sbW,
                  Expanded(
                    child: Container(
                      height: 1.h,
                      color: Palette.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            20.sbH,
            Padding(
              padding: 15.padH,
              child: Container(
                padding: 15.0.padA,
                width: double.infinity,
                height: 200.h,
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
                child: AppTexts.carDescriptionPlaceHolder
                    .txt(size: 13.sp, textAlign: TextAlign.justify),
              ),
            ),

            30.sbH,
            Padding(
              padding: 15.padH,
              child: Row(
                children: [
                  "Host".txt18(fontW: F.w6),
                  15.sbW,
                  Expanded(
                    child: Container(
                      height: 1.h,
                      color: Palette.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            20.sbH,
            RowRailer(
              rowPadding: 15.padH,
              leading: Row(
                children: [
                  Container(
                    height: 60.h,
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
                        child: AppGraphics.memeoji.png
                            .myImage(fit: BoxFit.contain)),
                  ),
                  15.sbW,
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        child: "Akinola Daniel Eri-ife"
                            .txt16(
                                textAlign: TextAlign.left,
                                fontW: F.w6,
                                overflow: TextOverflow.ellipsis)
                            .alignCenterLeft(),
                      ),
                      3.sbH,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          "4.5".txt14(textAlign: TextAlign.left, fontW: F.w4),
                          5.sbW,
                          Icon(
                            PhosphorIconsFill.star,
                            size: 15.h,
                            color: Palette.strydeOrange,
                          )
                        ],
                      ).alignCenterLeft(),
                    ],
                  ))
                ],
              ),
              trailing: Icon(
                PhosphorIconsFill.envelope,
                size: 30.h,
                color: Palette.strydeOrange,
              ),
            ),
            20.sbH,
            SizedBox(
              height: 260.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: 10.padH,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ReviewCard();
                },
              ),
            ),

            100.sbH
          ],
        ),
        floatingActionButton: Container(
          padding: 10.0.padA,
          height: 60.h,
          width: 350.h,
          decoration: BoxDecoration(
            color: Palette.blackColor,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Padding(
            padding: 10.padH,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "₦250,000 / day".txt16(fontW: F.w6),
                Container(
                  height: 40.h,
                  width: 100.h,
                  decoration: BoxDecoration(
                    color: Palette.strydeOrange,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Center(child: "Rent".txt16()),
                ).tap(onTap: () {
                  goTo(context: context, view: CalendarView());
                }),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
