import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/airport/providers/airport_providers.dart';
import 'package:stryde_guest_app/features/search/views/location_search_view.dart';
import 'package:stryde_guest_app/features/vehicles/views/airport_vehicle_selection_view.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
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
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.5.h, horizontal: 15.w),
                                    decoration: BoxDecoration(
                                      color: Palette.buttonBG,
                                      border: const Border(
                                          right: BorderSide(
                                              color: Palette.darkBG)),
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
                                          ? Palette.strydeOrange
                                          : Palette.buttonBG,
                                      border: const Border(
                                          left: BorderSide(
                                              color: Palette.darkBG)),
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
                              Opacity(
                                opacity: 0,
                                child: Container(
                                  height: 40.h,
                                  width: 40.h,
                                  decoration: BoxDecoration(
                                    color: Palette.greyColor.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.r)),
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
                              duration: const Duration(milliseconds: 300),
                              height: isVisible ? 180.h : 0,
                              child: SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
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
                                                  color: Palette.strydeOrange,
                                                  size: 20.h),
                                              5.sbH,
                                              Container(
                                                height: 10.h,
                                                width: 2.5.w,
                                                decoration: BoxDecoration(
                                                    color: Palette.strydeOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r)),
                                              ),
                                              2.5.sbH,
                                              Container(
                                                height: 20.h,
                                                width: 2.5.w,
                                                decoration: BoxDecoration(
                                                    color: Palette.strydeOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r)),
                                              ),
                                              2.5.sbH,
                                              Container(
                                                height: 20.h,
                                                width: 2.5.w,
                                                decoration: BoxDecoration(
                                                    color: Palette.strydeOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r)),
                                              ),
                                              2.5.sbH,
                                              Container(
                                                height: 10.h,
                                                width: 2.5.w,
                                                decoration: BoxDecoration(
                                                    color: Palette.strydeOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r)),
                                              ),
                                              5.sbH,
                                              Icon(PhosphorIconsFill.mapPinArea,
                                                  color: Palette.strydeOrange,
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
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 10.h),
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: Palette.buttonBG,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.r),
                                                      ),
                                                      height: 45.h,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              10.sbW,
                                                              "Starting Location"
                                                                  .txt14(),
                                                            ],
                                                          ),
                                                          Icon(
                                                            PhosphorIconsFill
                                                                .mapPin,
                                                            color: Palette
                                                                .strydeOrange,
                                                            size: 25.h,
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
                                                            .strydeOrange,
                                                        size: 18.h),
                                                  ),
                                                ),
                                                8.sbH,
                                                Hero(
                                                  tag: 'airportTag',
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 10.h),
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: Palette.buttonBG,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.r),
                                                      ),
                                                      height: 45.h,
                                                      child: Row(
                                                        children: [
                                                          10.sbW,
                                                          "Airport".txt14(),
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Bottom sheet
                  Visibility(
                    visible: startingLocation.isNotEmpty &&
                        destinationLocation.isNotEmpty,
                    child: ValueListenableBuilder<bool>(
                      valueListenable: _isContainerVisible,
                      builder: (context, isVisible, child) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: isVisible ? 120.h : 0,
                          color: Palette.blackColor,
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Padding(
                              padding: 15.0.padA,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      "Distance".txt14(),
                                      3.sbH,
                                      "19.5km".txt18(fontW: F.w6),
                                      3.sbH,
                                      "20 mins".txt14(),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 55.h,
                                        width: 170.h,
                                        decoration: BoxDecoration(
                                          color: Palette.strydeOrange,
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                        ),
                                        child: Center(
                                            child: "Choose Vehicle"
                                                .txt14(fontW: F.w6)),
                                      ).tap(onTap: () {
                                        goTo(
                                            context: context,
                                            view: AirportVehicleSeletionView());
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
