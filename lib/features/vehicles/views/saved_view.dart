import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stryde_guest_app/core/providers/global_providers.dart';
import 'package:stryde_guest_app/features/vehicles/models/rental_selection_model.dart';
import 'package:stryde_guest_app/features/vehicles/views/full_vehicle_rental_details_view.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/rental_display_card.dart';
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
          body: TabBarView(children: [
            GridView.builder(
              padding: 15.padV,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 0.8,
              ),
              itemCount: rentalSelections.length,
              itemBuilder: (context, index) {
                RentalSelection rentalCardDisplay = rentalSelections[index];
                return RentalDisplayCard(
                    carImagePath: rentalCardDisplay.carImagePath,
                    manufacturerName: rentalCardDisplay.manufacturerName,
                    modelName: rentalCardDisplay.modelName,
                    reviewStarCount: rentalCardDisplay.reviewCountAverage,
                    onTileTap: () {
                      goTo(
                          context: context,
                          view: FullVehicleRentalDetailsView());
                    },
                    onLikeTap: () {});
              },
            ),
            ...vehicleTypes.map((rentals) {
              // Filter the articles based on the selected category
              final filteredRentalSelection = rentalSelections
                  .where(
                      (rentalPicks) => rentalPicks.vehicleBodyType == rentals)
                  .toList();

              return GridView.builder(
                padding: 15.padV,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 0.8,
                ),
                itemCount: filteredRentalSelection.length,
                itemBuilder: (context, index) {
                  RentalSelection rentalCardDisplay =
                      filteredRentalSelection[index];
                  return RentalDisplayCard(
                      carImagePath: rentalCardDisplay.carImagePath,
                      manufacturerName: rentalCardDisplay.manufacturerName,
                      modelName: rentalCardDisplay.modelName,
                      reviewStarCount: rentalCardDisplay.reviewCountAverage,
                      onTileTap: () {
                        goTo(
                            context: context,
                            view: FullVehicleRentalDetailsView());
                      },
                      onLikeTap: () {});
                },
              );
            })
          ]),
        ),
      ),
    );
  }
}
