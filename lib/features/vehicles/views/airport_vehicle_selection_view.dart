import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/vehicles/models/airport_vehicle_selection.dart';
import 'package:stryde_guest_app/features/vehicles/providers/vehicle_providers.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/airport_vehicle_card.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_constants.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/container_list_tile.dart';
import 'package:stryde_guest_app/utils/widgets/sliver_appbar.dart';

// Define the state notifier
class AirportVehicleNotifier
    extends StateNotifier<List<AirportVehicleSelection>> {
  AirportVehicleNotifier() : super(airportVehicleSelections);

  void filterByCategory(String category) {
    if (category == 'All') {
      state = airportVehicleSelections;
    } else {
      state = airportVehicleSelections
          .where((vehicle) => vehicle.vehicleCategory == category)
          .toList();
    }
  }

  void filterBySubCategory(String subCategory) {
    if (subCategory == 'All') {
      state = airportVehicleSelections;
    } else {
      state = airportVehicleSelections
          .where((vehicle) => vehicle.vehicleSubCategory == subCategory)
          .toList();
    }
  }
}

// Define the provider
final airportVehicleProvider = StateNotifierProvider<AirportVehicleNotifier,
    List<AirportVehicleSelection>>((ref) {
  return AirportVehicleNotifier();
});

class AirportVehicleSelectionView extends ConsumerStatefulWidget {
  const AirportVehicleSelectionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AirportVehicleSelectionViewState();
}

class _AirportVehicleSelectionViewState
    extends ConsumerState<AirportVehicleSelectionView> {
  // List of vehicle categories
  List<String> airportVehicleCategories = [
    'All',
    'Executive',
    'Performance',
    'Coupes & Convertibles',
    'Utility',
    'Comfort',
  ];

  // Map of subcategories for each category
  Map<String, List<String>> subCategories = {
    'Executive': ['All', 'Sedan', 'SUV', 'Van', 'Elite', 'Armoured'],
    'Performance': ['All', 'Sedan', 'SUV', 'Elite SUV'],
    'Coupes & Convertibles': ['All', 'Elite'],
    'Utility': ['All', 'Pick-up Truck', 'Mini-Van', 'Bus'],
    'Comfort': ['All', 'Sedan', 'SUV', 'Hatch-Back', 'Station wagon'],
  };

  late final ValueNotifier<String> _currentVehicleCategoryNotifier =
      ValueNotifier<String>(airportVehicleCategories[0]);

  @override
  void dispose() {
    _currentVehicleCategoryNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vehicles = ref.watch(airportVehicleProvider);

    return ValueListenableBuilder<String>(
      valueListenable: _currentVehicleCategoryNotifier,
      builder: (context, vehicleCategory, child) {
        List<String> currentSubCategories = vehicleCategory == 'All'
            ? ['All']
            : subCategories[vehicleCategory] ?? ['All'];

        return Scaffold(
          endDrawer: Drawer(
            width: width(context) / 2,
            child: ListView.builder(
              padding: 15.0.padA,
              itemCount: airportVehicleCategories.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index == 0) 50.sbH,
                    OptionSelectionContainerTile(
                      horizontalContentPadding: 5.w,
                      leadingIcon: PhosphorIconsFill.circle,
                      leadingIconColor:
                          vehicleCategory == airportVehicleCategories[index]
                              ? Palette.strydeOrange
                              : Colors.transparent,
                      leadingIconSize: 15.h,
                      titleLabel: airportVehicleCategories[index],
                      titleFontWeight: F.w6,
                      interactiveTrailing: false,
                      onTileTap: () {
                        _currentVehicleCategoryNotifier.value =
                            airportVehicleCategories[index];
                        ref
                            .read(airportVehicleProvider.notifier)
                            .filterByCategory(airportVehicleCategories[index]);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          body: DefaultTabController(
            length: currentSubCategories.length,
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
                    title: vehicleCategory,
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
                              width: 4,
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
                        tabs: currentSubCategories
                            .map((subCategory) => Tab(text: subCategory))
                            .toList(),
                      ),
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: currentSubCategories.map((subCategory) {
                  return CustomScrollView(
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
                                  vehicles[index];
                              return AirportVehicleDisplayCard(
                                carImagePath:
                                    airportVehicleDisplay.carImagePath,
                                vehicleClass:
                                    airportVehicleDisplay.vehicleCategory,
                                vehicleYear: airportVehicleDisplay.vehicleYear,
                                rentalRate: airportVehicleDisplay.rentalRate,
                                seatCount: airportVehicleDisplay.seatCount,
                                onTileTap: () {
                                  ref
                                      .read(airportVehicleSelectionProvider
                                          .notifier)
                                      .state = true;
                                  goBack(context);
                                },
                              );
                            },
                            childCount: vehicles.length,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
