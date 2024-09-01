import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/core/providers/global_providers.dart';
import 'package:stryde_guest_app/features/vehicles/models/rental_selection_model.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/rental_display_card.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_constants.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/widgets/container_list_tile.dart';
import 'package:stryde_guest_app/utils/widgets/sliver_appbar.dart';

class AirportVehicleSeletionView extends ConsumerStatefulWidget {
  const AirportVehicleSeletionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AirportVehicleSeletionViewState();
}

class _AirportVehicleSeletionViewState
    extends ConsumerState<AirportVehicleSeletionView> {
  @override
  Widget build(BuildContext context) {
    final vehicleTypes = ref.watch(vehicleTypeSelectionProvider);
    return Scaffold(
      endDrawer: Drawer(
        width: width(context)/2,
        child: ListView(
          padding: 15.0.padA,
          children: [
            50.sbH,
            OptionSelectionContainerTile(
              horizontalContentPadding: 5.w,
              leadingIcon: PhosphorIconsFill.circle,
              leadingIconColor: Palette.strydeOrange,
              leadingIconSize: 15.h,
              titleLabel: "Executive",
              titleFontWeight: F.w6,
              interactiveTrailing: false,
            ),
            OptionSelectionContainerTile(
              horizontalContentPadding: 5.w,
              leadingIcon: PhosphorIconsFill.circle,
              leadingIconColor: Palette.strydeOrange,
              leadingIconSize: 15.h,
              titleLabel: "Performance",
              titleFontWeight: F.w6,
              interactiveTrailing: false,
            ),
            OptionSelectionContainerTile(
              horizontalContentPadding: 5.w,
              leadingIcon: PhosphorIconsFill.circle,
              leadingIconColor: Palette.strydeOrange,
              leadingIconSize: 15.h,
              titleLabel: "Coupes & Convertibles",
              titleFontWeight: F.w6,
              interactiveTrailing: false,
            ),
            OptionSelectionContainerTile(
              horizontalContentPadding: 5.w,
              leadingIcon: PhosphorIconsFill.circle,
              leadingIconColor: Palette.strydeOrange,
              leadingIconSize: 15.h,
              titleLabel: "Utility",
              titleFontWeight: F.w6,
              interactiveTrailing: false,
            ),
            OptionSelectionContainerTile(
              horizontalContentPadding: 5.w,
              leadingIcon: PhosphorIconsFill.circle,
              leadingIconColor: Palette.strydeOrange,
              leadingIconSize: 15.h,
              titleLabel: "Comfort",
              titleFontWeight: F.w6,
              interactiveTrailing: false,
            ),
            OptionSelectionContainerTile(
              horizontalContentPadding: 5.w,
              leadingIcon: PhosphorIconsFill.circle,
              leadingIconColor: Palette.strydeOrange,
              leadingIconSize: 15.h,
              titleLabel: "Electric",
              titleFontWeight: F.w6,
              interactiveTrailing: false,
            ),

          ],
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
                  title: "Executive",
                  titleFontSize: 20.sp,
                  titleFontWeight: FontWeight.w100,
                  actions: [
                    Padding(
                      padding: 20.padH,
                      child: Icon(
                        PhosphorIconsFill.squaresFour,
                        color: Palette.strydeOrange,
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
                        Tab(text: "All (${rentalSelections.length})"),
                        ...vehicleTypes.asMap().entries.map((entry) {
                          String vehicleClass = entry.value;
                          int vehicleClassCount = rentalSelections
                              .where((rentalSelection) =>
                                  rentalSelection.vehicleBodyType ==
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 15.h,
                          childAspectRatio: 0.8,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            RentalSelection rentalCardDisplay =
                                rentalSelections[index];
                            return RentalDisplayCard(
                              carImagePath: rentalCardDisplay.carImagePath,
                              manufacturerName:
                                  rentalCardDisplay.manufacturerName,
                              modelName: rentalCardDisplay.modelName,
                              reviewStarCount:
                                  rentalCardDisplay.reviewCountAverage,
                              onTileTap: () {},
                              onLikeTap: () {},
                            );
                          },
                          childCount: rentalSelections.length,
                        ),
                      ),
                    ),
                  ],
                ),
                ...vehicleTypes.map((rentals) {
                  final filteredRentalSelection = rentalSelections
                      .where((rentalPicks) =>
                          rentalPicks.vehicleBodyType == rentals)
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
                              RentalSelection rentalCardDisplay =
                                  filteredRentalSelection[index];
                              return RentalDisplayCard(
                                carImagePath: rentalCardDisplay.carImagePath,
                                manufacturerName:
                                    rentalCardDisplay.manufacturerName,
                                modelName: rentalCardDisplay.modelName,
                                reviewStarCount:
                                    rentalCardDisplay.reviewCountAverage,
                                onTileTap: () {},
                                onLikeTap: () {},
                              );
                            },
                            childCount: filteredRentalSelection.length,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            )),
      ),
    );
  }
}
