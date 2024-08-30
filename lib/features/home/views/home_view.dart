import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/core/providers/global_providers.dart';
import 'package:stryde_guest_app/features/home/widgets/ad_display_card.dart';
import 'package:stryde_guest_app/features/vehicles/models/rental_selection_model.dart';
import 'package:stryde_guest_app/features/vehicles/views/full_vehicle_rental_details_view.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/rental_display_card.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_constants.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/sliver_appbar.dart';
import 'package:stryde_guest_app/utils/widgets/text_input.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final TextEditingController _searchFieldController = TextEditingController();
  final ValueNotifier<int> _pageBuilderNotifier = 0.notifier;

  @override
  void dispose() {
    _searchFieldController.dispose();
    _pageBuilderNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vehicleTypes = ref.watch(vehicleTypeSelectionProvider);
    return Scaffold(
        body: _pageBuilderNotifier.sync(builder: (context, currentPage, child) {
      if (currentPage == 0) {
        return DefaultTabController(
          length: vehicleTypes.length + 1,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverwareAppBar(
                  appBarToolbarheight: 60.h,
                  sliverCollapseMode: CollapseMode.pin,
                  isPinned: true,
                  canStretch: false,
                  isFloating: true,
                  customizeLeadingWidget: false,
                  showLeadingIconOrWidget: false,
                  titleCentered: true,
                  isTitleAWidget: false,
                  titleWidget: const SizedBox.shrink(),
                  titleFontSize: 20.sp,
                  titleFontWeight: FontWeight.w100,
                  expandedHeight: height(context) * 0.53,
                  expandedSliverSpaceBackground: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      50.sbH,
                      Padding(
                        padding: 15.padH,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Palette.buttonBG.withOpacity(0.5),
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
                              child: Center(
                                child: AppGraphics.memeoji.png
                                    .myImage(fit: BoxFit.contain),
                              ),
                            ).tap(onTap: () {}),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.5.h, horizontal: 15.w),
                                  decoration: BoxDecoration(
                                    color: currentPage == 0
                                        ? Palette.strydeOrange
                                        : Palette.buttonBG,
                                    border: const Border(
                                        right:
                                            BorderSide(color: Palette.darkBG)),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.r),
                                      bottomLeft: Radius.circular(15.r),
                                    ),
                                  ),
                                  child: Center(
                                      child: "Rentals".txt14(fontW: F.w6)),
                                ).tap(onTap: () {}),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.5.h, horizontal: 15.w),
                                  decoration: BoxDecoration(
                                    color: Palette.buttonBG,
                                    border: const Border(
                                        left:
                                            BorderSide(color: Palette.darkBG)),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15.r),
                                      bottomRight: Radius.circular(15.r),
                                    ),
                                  ),
                                  child: Center(
                                      child: "Airport".txt14(fontW: F.w6)),
                                ).tap(onTap: () {
                                  _pageBuilderNotifier.value = 1;
                                })
                              ],
                            ),
                            Container(
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
                          ],
                        ),
                      ),
                      20.sbH,
                      Padding(
                        padding: 15.padH,
                        child: TextInputWidget(
                          height: 50.h,
                          radiusValue: 25.r,
                          prefix: Padding(
                            padding: 10.padH,
                            child: Icon(
                              PhosphorIconsBold.magnifyingGlass,
                              color: Palette.strydeOrange,
                              size: 23.h,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: 15.padH,
                            child: Icon(
                              PhosphorIconsFill.funnel,
                              color: Palette.strydeOrange,
                              size: 23.h,
                            ),
                          ),
                          hintText: "Search Vehicle",
                          controller: _searchFieldController,
                        ),
                      ),
                      20.sbH,
                      SizedBox(
                        height: 180.h,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: 7.5.padH,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: 7.5.padH,
                              child: const AdDisplayCard(),
                            );
                          },
                        ),
                      ),
                      20.sbH,
                      Padding(
                        padding: 15.padH,
                        child: "Popular".txt18(
                          fontW: F.w6,
                        ),
                      ),
                    ],
                  ),
                  sliverBottom: AppBar(
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    scrolledUnderElevation: 0,
                    toolbarHeight: 50.h,
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
                        const Tab(text: "All"),
                        ...vehicleTypes.asMap().entries.map((entry) {
                          String vehicleClass = entry.value;
                          // int vehicleClassCount = rentalSelections
                          //     .where((rentalSelection) =>
                          //         rentalSelection.vehicleBodyType == vehicleClass)
                          //     .length;
                          return Tab(
                            text: vehicleClass,
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
                padding: 10.padV,
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
        );
      } else {
        return ListView(
          children: [
            25.sbH,
            Padding(
              padding: 15.padH,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50.h,
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
                      child:
                          AppGraphics.memeoji.png.myImage(fit: BoxFit.contain),
                    ),
                  ).tap(onTap: () {
                    _pageBuilderNotifier.value = 0;
                  }),
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
                              right: BorderSide(color: Palette.darkBG)),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            bottomLeft: Radius.circular(15.r),
                          ),
                        ),
                        child: Center(child: "Rentals".txt14(fontW: F.w6)),
                      ).tap(onTap: () {
                        _pageBuilderNotifier.value = 0;
                      }),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.5.h, horizontal: 15.w),
                        decoration: BoxDecoration(
                          color: currentPage == 1
                              ? Palette.strydeOrange
                              : Palette.buttonBG,
                          border: const Border(
                              left: BorderSide(color: Palette.darkBG)),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r),
                          ),
                        ),
                        child: Center(child: "Airport".txt14(fontW: F.w6)),
                      ).tap(onTap: () {})
                    ],
                  ),
                  Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                      color: Palette.greyColor.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    child: const Icon(
                      PhosphorIconsRegular.bellSimple,
                      color: Palette.whiteColor,
                    ),
                  ).tap(onTap: () {}),
                ],
              ),
            ),
          ],
        );
      }
    }));
  }
}
