import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/core/providers/global_providers.dart';
import 'package:stryde_guest_app/features/vehicles/models/airport_vehicle_selection.dart';
import 'package:stryde_guest_app/features/vehicles/providers/vehicle_providers.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/airport_vehicle_card.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_constants.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/container_list_tile.dart';
import 'package:stryde_guest_app/utils/widgets/sliver_appbar.dart';

class AirportVehicleSelectionView extends ConsumerStatefulWidget {
  const AirportVehicleSelectionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AirportVehicleSelectionViewState();
}

class _AirportVehicleSelectionViewState
    extends ConsumerState<AirportVehicleSelectionView> {
  // List of vehicle classes
  List<String> airportVehicleClasses = [
    'Executive',
    'Performance',
    'Coupes & Convertibles',
    'Utility',
    'Comfort',
    'Electric'
  ];

  // ValueNotifier initialized to the first value of airportVehicleClasses
  late final ValueNotifier<String> _currentVehicleClassNotifier =
      ValueNotifier<String>(airportVehicleClasses[0]);

  @override
  void dispose() {
    _currentVehicleClassNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vehicleTypes = ref.watch(airportVehicleTypeSelectionProvider);

    return ValueListenableBuilder<String>(
      valueListenable: _currentVehicleClassNotifier,
      builder: (context, vehicleClass, child) {
        return Scaffold(
          endDrawer: Drawer(
            width: width(context) / 2,
            child: ListView.builder(
              padding: 15.0.padA,
              itemCount: airportVehicleClasses.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index == 0) 50.sbH, // Add space before the first item
                    OptionSelectionContainerTile(
                      horizontalContentPadding: 5.w,
                      leadingIcon: PhosphorIconsFill.circle,
                      leadingIconColor:
                          vehicleClass == airportVehicleClasses[index]
                              ? Palette.strydeOrange
                              : Colors.transparent,
                      leadingIconSize: 15.h,
                      titleLabel: airportVehicleClasses[index],
                      titleFontWeight: F.w6,
                      interactiveTrailing: false,
                      onTileTap: () {
                        // Update the ValueNotifier with the selected value
                        _currentVehicleClassNotifier.value =
                            airportVehicleClasses[index];
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          body: DefaultTabController(
            length: vehicleTypes.length + 1,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverwareAppBar(
                    appBarToolbarheight: 55.h,
                    sliverCollapseMode: CollapseMode.parallax,
                    isPinned: true,
                    canStretch: false,
                    isFloating: true,
                    customizeLeadingWidget: false,
                    showLeadingIconOrWidget: true,
                    titleCentered: true,
                    isTitleAWidget: false,
                    title: vehicleClass,
                    titleFontSize: 20.sp,
                    titleFontWeight: FontWeight.w100,
                    actions: [
                      Padding(
                        padding: 20.padH,
                        child: Icon(
                          PhosphorIconsFill.squaresFour,
                          color: Palette.whiteColor,
                          size: 30.h,
                        ).tap(onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        }),
                      )
                    ],
                    sliverBottom: AppBar(
                      centerTitle: true,
                      automaticallyImplyLeading: false,
                      scrolledUnderElevation: 0,
                      toolbarHeight: 60.h,
                      actions: const <Widget>[SizedBox.shrink()],
                      title: TabBar(
                        isScrollable: true,
                        padding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.center,
                        indicatorSize: TabBarIndicatorSize.label,
                        dividerColor: Colors.transparent,
                        indicator: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: Palette.strydeOrange,
                            ),
                          ),
                        ),
                        labelColor: Palette.strydeOrange,
                        unselectedLabelColor: Palette.whiteColor,
                        labelStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        unselectedLabelStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(fontSize: 16.sp),
                        ),
                        tabs: [
                          Tab(text: "All (${airportVehicleSelections.length})"),
                          ...vehicleTypes.asMap().entries.map((entry) {
                            String vehicleClass = entry.value;
                            int vehicleClassCount = airportVehicleSelections
                                .where((airportVehicleSelections) =>
                                    airportVehicleSelections.vehicleClass ==
                                    vehicleClass)
                                .length;
                            return Tab(
                              text: "$vehicleClass ($vehicleClassCount)",
                            );
                          }),
                        ],
                      ),
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: [
                  CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 15.w),
                        sliver: SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15.w,
                            mainAxisSpacing: 15.h,
                            childAspectRatio: 0.8,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              AirportVehicleSelection airportVehicleDisplay =
                                  airportVehicleSelections[index];
                              return AirportVehicleDisplayCard(
                                carImagePath:
                                    airportVehicleDisplay.carImagePath,
                                vehicleClass:
                                    airportVehicleDisplay.vehicleClass,
                                vehicleYear: airportVehicleDisplay.vehicleYear,
                                rentalRate: airportVehicleDisplay.rentalRate,
                                reviewStarCount:
                                    airportVehicleDisplay.reviewCountAverage,
                                onTileTap: () {
                                  ref
                                      .read(airportVehicleSelectionProvider
                                          .notifier)
                                      .state = true;
                                  goBack(context);
                                },
                              );
                            },
                            childCount: airportVehicleSelections.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...vehicleTypes.map((airport) {
                    final filteredAirportSelection = airportVehicleSelections
                        .where((airportPicks) =>
                            airportPicks.vehicleClass == airport)
                        .toList();

                    return CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 15.w),
                          sliver: SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15.w,
                              mainAxisSpacing: 15.h,
                              childAspectRatio: 0.8,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                AirportVehicleSelection airportVehicleDisplay =
                                    filteredAirportSelection[index];
                                return AirportVehicleDisplayCard(
                                carImagePath:
                                    airportVehicleDisplay.carImagePath,
                                vehicleClass:
                                    airportVehicleDisplay.vehicleClass,
                                vehicleYear: airportVehicleDisplay.vehicleYear,
                                rentalRate: airportVehicleDisplay.rentalRate,
                                reviewStarCount:
                                    airportVehicleDisplay.reviewCountAverage,
                                onTileTap: () {
                                  ref
                                      .read(airportVehicleSelectionProvider
                                          .notifier)
                                      .state = true;
                                  goBack(context);
                                },
                              );
                              },
                              childCount: filteredAirportSelection.length,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
