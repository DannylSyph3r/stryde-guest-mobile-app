import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/airport/providers/airport_providers.dart';
import 'package:stryde_guest_app/features/airport/views/airport_account_view.dart';
import 'package:stryde_guest_app/features/messages/views/chat_view.dart';
import 'package:stryde_guest_app/features/search/views/location_search_view.dart';
import 'package:stryde_guest_app/features/vehicles/providers/vehicle_providers.dart';
import 'package:stryde_guest_app/features/vehicles/views/airport_vehicle_selection_view.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_constants.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/custom_modal_bottomsheet.dart';
import 'package:stryde_guest_app/utils/frosted_glass_box.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';

class HomeAirportView extends ConsumerStatefulWidget {
  final ValueNotifier<int> switcherNotifier;
  const HomeAirportView({required this.switcherNotifier, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeAirportViewState();
}

class _HomeAirportViewState extends ConsumerState<HomeAirportView> {
  final TextEditingController _startingLocationController =
      TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final ValueNotifier<bool> _isContainerVisible = ValueNotifier(true);
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _isContainerVisible.dispose();
    _startingLocationController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 2), () {
      _isContainerVisible.value = true;
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final startingLocation = ref.watch(startingLocationProvider);
    final destinationLocation = ref.watch(desinationLocationProvider);
    final isDriverSelected = ref.watch(airportVehicleSelectionProvider);
    final isTripStarted = ref.watch(tripStartedNotiferProvider);
    final isTripCompleted = ref.watch(tripCompletedNotifier);
    return Scaffold(
      appBar: customAppBar(
          toolbarHeight: 10.h,
          implyLeading: false,
          color: Palette.blackColor,
          context: context),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 100.h,
          child: Stack(
            children: [
              // Map (main content)
              Positioned.fill(
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.delta.dy != 0) {
                      _isContainerVisible.value = false;
                      _resetTimer();
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    if (details.delta.dx != 0) {
                      _isContainerVisible.value = false;
                      _resetTimer();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('map'.png),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Palette.blackColor,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.5.w, vertical: 14.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 51.h,
                                padding: 10.0.padA,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Palette.strydeOrange.withOpacity(0.2),
                                      spreadRadius: 10,
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  PhosphorIconsBold.list,
                                  color: Palette.strydeOrange,
                                ).tap(onTap: () {
                                  goTo(
                                      context: context,
                                      view: AirportAccountView());
                                }),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.5.h, horizontal: 15.w),
                                    decoration: BoxDecoration(
                                      color: widget.switcherNotifier.value == 0
                                          ? Palette.buttonBG
                                          : Palette.darkBG,
                                      border: Border.all(
                                          color: Palette.buttonBG, width: 1.5),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.r),
                                        bottomLeft: Radius.circular(15.r),
                                      ),
                                    ),
                                    child: Center(
                                        child: "Rentals".txt14(fontW: F.w6)),
                                  ).tap(onTap: () {
                                    widget.switcherNotifier.value = 0;
                                  }),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.5.h, horizontal: 15.w),
                                    decoration: BoxDecoration(
                                      color: widget.switcherNotifier.value == 1
                                          ? Palette.buttonBG
                                          : Palette.darkBG,
                                      border: Border.all(
                                          color: Palette.buttonBG, width: 1.5),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15.r),
                                        bottomRight: Radius.circular(15.r),
                                      ),
                                    ),
                                    child: Center(
                                        child: "Airport".txt14(fontW: F.w6)),
                                  ).tap(onTap: () {}),
                                ],
                              ),
                              isTripStarted
                                  ? "Finish".txt14().tap(onTap: () {
                                      ref
                                          .read(tripCompletedNotifier.notifier)
                                          .state = true;
                                      showCustomModal(
                                        context,
                                        onDismissed: () {
                                          ref
                                              .read(tripCompletedNotifier
                                                  .notifier)
                                              .state = false;
                                          ref
                                              .read(tripStartedNotiferProvider
                                                  .notifier)
                                              .state = false;
                                          ref
                                              .read(
                                                  airportVehicleSelectionProvider
                                                      .notifier)
                                              .state = false;
                                          ref.invalidate(
                                              startingLocationProvider);
                                          ref.invalidate(
                                              desinationLocationProvider);
                                        },
                                        modalHeight: 270.h,
                                        child: Column(
                                          children: [
                                            20.sbH,
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  PhosphorIconsFill.trophy,
                                                  color: Palette.strydeOrange,
                                                ),
                                                10.sbW,
                                                "Trip Completed"
                                                    .txt16(fontW: F.w6),
                                              ],
                                            ),
                                            10.sbH,
                                            Container(
                                              padding: 15.0.padA,
                                              height: 100.h,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    // First Row: Avatar and Text Details
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 60.h,
                                                          width: 60.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Palette
                                                                .buttonBG
                                                                .withOpacity(
                                                                    0.5),
                                                            shape:
                                                                BoxShape.circle,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Palette
                                                                    .strydeOrange
                                                                    .withOpacity(
                                                                        0.2),
                                                                spreadRadius:
                                                                    10,
                                                                blurRadius: 15,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Center(
                                                            child: AppGraphics
                                                                .memeoji.png
                                                                .myImage(
                                                                    fit: BoxFit
                                                                        .contain),
                                                          ),
                                                        ),
                                                        15.sbW,
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              "Akinola Daniel Eri-ife"
                                                                  .txt16(
                                                                fontW: F.w6,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis, // Handle overflow
                                                              ),
                                                              3.sbH,
                                                              Row(
                                                                children: [
                                                                  "4.5".txt14(
                                                                      fontW:
                                                                          F.w4),
                                                                  5.sbW,
                                                                  Icon(
                                                                    PhosphorIconsFill
                                                                        .star,
                                                                    size: 15.h,
                                                                    color: Palette
                                                                        .strydeOrange,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  20.sbW,
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      "Distance".txt14(),
                                                      3.sbH,
                                                      "20.5km"
                                                          .txt18(fontW: F.w6),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            10.sbH,
                                            RatingBar.builder(
                                              itemSize: 35.h,
                                              initialRating: 0,
                                              minRating: 0,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: 1.padH,
                                              unratedColor:
                                                  Colors.grey.withOpacity(0.8),
                                              itemBuilder: (context, _) => Icon(
                                                PhosphorIconsFill.star,
                                                color: Palette.strydeOrange,
                                                size: 35.h,
                                              ),
                                              onRatingUpdate: (rating) {
                                                rating.log();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                  : Opacity(
                                      opacity: 0,
                                      child: Container(
                                        height: 40.h,
                                        width: 40.h,
                                        decoration: BoxDecoration(
                                          color: Palette.greyColor
                                              .withOpacity(0.3),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.r)),
                                        ),
                                        child: const Icon(
                                          PhosphorIconsRegular.bellSimple,
                                          color: Palette.whiteColor,
                                        ),
                                      ).tap(onTap: () {}),
                                    ),
                            ],
                          ),
                        ),
                        // Top bar
                        ValueListenableBuilder<bool>(
                          valueListenable: _isContainerVisible,
                          builder: (context, isVisible, child) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              height:
                                  isTripStarted ? 0 : (isVisible ? 180.h : 0),
                              child: SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 100),
                                  opacity: isVisible ? 1 : 0,
                                  child: Column(
                                    children: [
                                      10.sbH,
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Icon(PhosphorIconsFill.circle,
                                                    color: Palette.whiteColor,
                                                    size: 20.h),
                                                5.sbH,
                                                Container(
                                                  height: 10.h,
                                                  width: 2.5.w,
                                                  decoration: BoxDecoration(
                                                      color: Palette.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r)),
                                                ),
                                                2.5.sbH,
                                                Container(
                                                  height: 20.h,
                                                  width: 2.5.w,
                                                  decoration: BoxDecoration(
                                                      color: Palette.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r)),
                                                ),
                                                2.5.sbH,
                                                Container(
                                                  height: 20.h,
                                                  width: 2.5.w,
                                                  decoration: BoxDecoration(
                                                      color: Palette.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r)),
                                                ),
                                                2.5.sbH,
                                                Container(
                                                  height: 10.h,
                                                  width: 2.5.w,
                                                  decoration: BoxDecoration(
                                                      color: Palette.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r)),
                                                ),
                                                5.sbH,
                                                Icon(
                                                    PhosphorIconsFill
                                                        .mapPinArea,
                                                    color: Palette.whiteColor,
                                                    size: 20.h),
                                              ],
                                            ),
                                            15.sbW,
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Hero(
                                                    tag: 'startingLocationTag',
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    10.w,
                                                                vertical: 10.h),
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Palette.buttonBG,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.r),
                                                        ),
                                                        height: 45.h,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                children: [
                                                                  10.sbW,
                                                                  Flexible(
                                                                    child: startingLocation ==
                                                                            ""
                                                                        ? "Starting Location".txt14(
                                                                            overflow: TextOverflow
                                                                                .ellipsis)
                                                                        : startingLocation.txt14(
                                                                            overflow:
                                                                                TextOverflow.ellipsis),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Icon(
                                                              PhosphorIconsFill
                                                                  .mapPin,
                                                              color: Palette
                                                                  .whiteColor,
                                                              size: 25.h,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ).gestureTap(onTap: () {
                                                    goToUnanimated(
                                                        context: context,
                                                        view: const LocationSearchView(
                                                            isStartingLocation:
                                                                true));
                                                  }),
                                                  8.sbH,
                                                  Container(
                                                    padding: 7.5.padA,
                                                    decoration: BoxDecoration(
                                                        color: Palette.greyColor
                                                            .withOpacity(0.3),
                                                        shape: BoxShape.circle),
                                                    child: Center(
                                                      child: Icon(
                                                          PhosphorIconsBold
                                                              .arrowsDownUp,
                                                          color: Palette
                                                              .whiteColor,
                                                          size: 18.h),
                                                    ),
                                                  ),
                                                  8.sbH,
                                                  Hero(
                                                    tag: 'airportTag',
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    10.w,
                                                                vertical: 10.h),
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Palette.buttonBG,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.r),
                                                        ),
                                                        height: 45.h,
                                                        child: Row(
                                                          children: [
                                                            10.sbW,
                                                            Expanded(
                                                              child: destinationLocation ==
                                                                      ""
                                                                  ? "Airport".txt14(
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis)
                                                                  : destinationLocation
                                                                      .txt14(
                                                                          overflow:
                                                                              TextOverflow.ellipsis),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ).gestureTap(onTap: () {
                                                    goToUnanimated(
                                                        context: context,
                                                        view:
                                                            const LocationSearchView(
                                                          isStartingLocation:
                                                              false,
                                                        ));
                                                  }),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Bottom sheet
                  Container(
                    color: Palette.blackColor,
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          padding: 15.0.padA,
                          height: isDriverSelected ? 100.h : 0,
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  // First Row: Avatar and Text Details
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60.h,
                                        width: 60.h,
                                        decoration: BoxDecoration(
                                          color:
                                              Palette.buttonBG.withOpacity(0.5),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Palette.strydeOrange
                                                  .withOpacity(0.2),
                                              spreadRadius: 10,
                                              blurRadius: 15,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: AppGraphics.memeoji.png
                                              .myImage(fit: BoxFit.contain),
                                        ),
                                      ),
                                      15.sbW,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            "Akinola Daniel Eri-ife".txt16(
                                              fontW: F.w6,
                                              overflow: TextOverflow
                                                  .ellipsis, // Handle overflow
                                            ),
                                            3.sbH,
                                            Row(
                                              children: [
                                                "4.5".txt14(fontW: F.w4),
                                                5.sbW,
                                                Icon(
                                                  PhosphorIconsFill.star,
                                                  size: 15.h,
                                                  color: Palette.strydeOrange,
                                                ),
                                              ],
                                            ),
                                            3.sbH,
                                            "SUV, 2006".txt12(fontW: F.w6)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                20.sbW,
                                Row(
                                  children: [
                                    if (isTripStarted)
                                      Icon(
                                        PhosphorIconsFill.envelope,
                                        color: Palette.whiteColor,
                                        size: 30.h,
                                      ).tap(onTap: () {
                                        goTo(
                                            context: context, view: ChatView());
                                      }),
                                    15.sbW,
                                    Icon(
                                      PhosphorIconsFill.xCircle,
                                      color: Colors.red,
                                      size: 32.h,
                                    ).tap(onTap: () {
                                      if (isTripStarted) {
                                        ref
                                            .read(tripStartedNotiferProvider
                                                .notifier)
                                            .state = false;
                                        ref
                                            .read(
                                                airportVehicleSelectionProvider
                                                    .notifier)
                                            .state = false;
                                      } else {
                                        ref
                                            .read(
                                                airportVehicleSelectionProvider
                                                    .notifier)
                                            .state = false;
                                      }
                                    }),
                                    if (!isTripStarted) ...[
                                      15.sbW,
                                      Icon(
                                        PhosphorIconsFill.steeringWheel,
                                        color: Palette.whiteColor,
                                        size: 30.h,
                                      ),
                                      15.sbW,
                                      Icon(
                                        PhosphorIconsFill.caretCircleRight,
                                        color: Palette.whiteColor,
                                        size: 30.h,
                                      ),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: startingLocation.isNotEmpty &&
                              destinationLocation.isNotEmpty,
                          child: ValueListenableBuilder<bool>(
                            valueListenable: _isContainerVisible,
                            builder: (context, isVisible, child) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                height:
                                    isTripStarted ? 0 : (isVisible ? 120.h : 0),
                                color: Palette.blackColor,
                                child: SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 100),
                                    opacity: isVisible ? 1 : 0,
                                    child: Padding(
                                      padding: 15.0.padA,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              "Distance".txt14(),
                                              3.sbH,
                                              "19.5km".txt18(fontW: F.w6),
                                              3.sbH,
                                              "Est: 20 mins".txt14(),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds:
                                                        300), // Duration for the width animation
                                                curve: Curves
                                                    .easeInOut, // Animation curve for smooth transition
                                                height: 55.h,
                                                width: isDriverSelected
                                                    ? 120.h
                                                    : 170.h,
                                                decoration: BoxDecoration(
                                                  color: Palette.strydeOrange,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.r),
                                                ),
                                                child: Center(
                                                  child: AnimatedSwitcher(
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    transitionBuilder:
                                                        (Widget child,
                                                            Animation<double>
                                                                animation) {
                                                      return FadeTransition(
                                                        opacity: animation,
                                                        child: child,
                                                      );
                                                    },
                                                    child: isDriverSelected
                                                        ? Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Icon(
                                                                PhosphorIconsFill
                                                                    .navigationArrow,
                                                                size: 25.h,
                                                              ),
                                                              8.sbW,
                                                              "Start".txt14(
                                                                  fontW: F.w6),
                                                            ],
                                                          )
                                                        : "Choose Vehicle"
                                                            .txt14(
                                                            fontW: F.w6,
                                                          ),
                                                  ),
                                                ),
                                              ).tap(onTap: () {
                                                isDriverSelected
                                                    ? ref
                                                        .read(
                                                            tripStartedNotiferProvider
                                                                .notifier)
                                                        .state = true
                                                    : goTo(
                                                        context: context,
                                                        view:
                                                            AirportVehicleSelectionView());
                                              }),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Visibility(
                visible: isTripCompleted,
                child: FrostedGlassBox(
                    theWidth: width(context),
                    theHeight: height(context),
                    theChild: const SizedBox.shrink()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
