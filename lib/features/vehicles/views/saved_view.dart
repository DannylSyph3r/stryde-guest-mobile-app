import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stryde_guest_app/core/providers/global_providers.dart';
import 'package:stryde_guest_app/features/vehicles/models/rental_selection_model.dart';
import 'package:stryde_guest_app/features/vehicles/views/full_vehicle_rental_details_view.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/rental_display_card.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/sliver_appbar.dart';

class SavedView extends ConsumerStatefulWidget {
  const SavedView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SavedViewState();
}

class _SavedViewState extends ConsumerState<SavedView> {
  @override
  Widget build(BuildContext context) {
    final vehicleTypes = ref.watch(vehicleTypeSelectionProvider);
    return Scaffold(
      body: DefaultTabController(
        length: vehicleTypes.length + 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverwareAppBar(
                appBarToolbarheight: 55.h,
                sliverCollapseMode: CollapseMode.parallax,
                isPinned: true,
                canStretch: false,
                isFloating: true,
                customizeLeadingWidget: false,
                showLeadingIconOrWidget: false,
                titleCentered: true,
                isTitleAWidget: false,
                title: "Saved",
                titleFontSize: 20.sp,
                titleFontWeight: FontWeight.w100,
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
                    tabs: [
                      Tab(text: "All (${rentalSelections.length})"),
                      ...vehicleTypes.asMap().entries.map((entry) {
                        String vehicleClass = entry.value;
                        int vehicleClassCount = rentalSelections
                            .where((rentalSelection) =>
                                rentalSelection.vehicleBodyType == vehicleClass)
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
                  if (rentalSelections.isEmpty)
                    SliverFillRemaining(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppGraphics.emptySaved.png.myImage(),
                            10.sbH,
                            "Save your dream ride".txt12()
                          ],
                        ),
                      ),
                    )
                  else
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
                              imageHeroTag: 'savedViewAllTab$index',
                              carImagePath: rentalCardDisplay.carImagePath,
                              manufacturerName:
                                  rentalCardDisplay.manufacturerName,
                              modelName: rentalCardDisplay.modelName,
                              reviewStarCount:
                                  rentalCardDisplay.reviewCountAverage,
                              onTileTap: () {
                                goToUnanimated(
                                    context: context,
                                    view: FullVehicleRentalDetailsView(
                                      vehicleViewHeroTag:
                                          'savedViewAllTab$index',
                                    ));
                              },
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
                    .where(
                        (rentalPicks) => rentalPicks.vehicleBodyType == rentals)
                    .toList();

                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    if (filteredRentalSelection.isEmpty)
                      SliverFillRemaining(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppGraphics.emptySaved.png.myImage(),
                              10.sbH,
                              "Save your dream ride".txt14()
                            ],
                          ),
                        ),
                      )
                    else
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
                              RentalSelection rentalCardDisplay =
                                  filteredRentalSelection[index];
                              return RentalDisplayCard(
                                imageHeroTag: 'savedViewFilteredTabs$index',
                                carImagePath: rentalCardDisplay.carImagePath,
                                manufacturerName:
                                    rentalCardDisplay.manufacturerName,
                                modelName: rentalCardDisplay.modelName,
                                reviewStarCount:
                                    rentalCardDisplay.reviewCountAverage,
                                onTileTap: () {
                                  goToUnanimated(
                                      context: context,
                                      view: FullVehicleRentalDetailsView(
                                        vehicleViewHeroTag:
                                            'savedViewFilteredTabs$index',
                                      ));
                                },
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
          ),
        ),
      ),
    );
  }
}
