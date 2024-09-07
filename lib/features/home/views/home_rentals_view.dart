import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/core/providers/global_providers.dart';
import 'package:stryde_guest_app/features/home/views/user_account_view.dart';
import 'package:stryde_guest_app/features/home/widgets/ad_display_card.dart';
import 'package:stryde_guest_app/features/notifications/views/notifications_view.dart';
import 'package:stryde_guest_app/features/search/views/vehicle_search_view.dart';
import 'package:stryde_guest_app/features/vehicles/models/rental_selection_model.dart';
import 'package:stryde_guest_app/features/vehicles/views/full_vehicle_rental_details_view.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/rental_display_card.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_constants.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/sliver_appbar.dart';
import 'package:video_player/video_player.dart';

class HomeRentalsView extends ConsumerStatefulWidget {
  final ValueNotifier<int> switcherNotifier;
  const HomeRentalsView({required this.switcherNotifier, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeRentalsViewState();
}

class _HomeRentalsViewState extends ConsumerState<HomeRentalsView> {
  final TextEditingController _searchFieldController = TextEditingController();
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.asset('lib/assets/images/car_ad.mp4')
          ..initialize().then((_) {
            setState(() {
              _videoController.play();
              _videoController.setLooping(true);
            });
          }).catchError((error) {
            // Handle video loading error
            'Error loading video: $error'.log();
          });
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    _currentIndexNotifier.dispose();
    _videoController.dispose(); // Dispose of the video controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vehicleTypes = ref.watch(vehicleTypeSelectionProvider);
    return DefaultTabController(
      length: vehicleTypes.length + 1,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverwareAppBar(
                appBarToolbarheight: 0.h,
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
                expandedHeight: height(context) * 0.545,
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
                            height: 51.h,
                            decoration: BoxDecoration(
                              color: Palette.buttonBG.withOpacity(0.5),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Palette.strydeOrange.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Center(
                              child: AppGraphics.memeoji.png
                                  .myImage(fit: BoxFit.contain),
                            ),
                          ).tap(onTap: () {
                            _videoController.pause();
                            goTo(context: context, view: UserAccountView());
                          }),
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
                                child:
                                    Center(child: "Rentals".txt14(fontW: F.w6)),
                              ).tap(onTap: () {}),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.5.h, horizontal: 15.w),
                                decoration: BoxDecoration(
                                  color: widget.switcherNotifier.value == 1
                                      ? Palette.greyColor
                                      : Palette.darkBG,
                                  border: Border.all(
                                      color: Palette.buttonBG, width: 1.5),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15.r),
                                    bottomRight: Radius.circular(15.r),
                                  ),
                                ),
                                child:
                                    Center(child: "Airport".txt14(fontW: F.w6)),
                              ).tap(onTap: () {
                                widget.switcherNotifier.value = 1;
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
                          ).tap(onTap: () {
                            _videoController.pause();
                            goTo(context: context, view: NotificationsView());
                          }),
                        ],
                      ),
                    ),
                    20.sbH,
                    Padding(
                        padding: 15.padH,
                        child: Hero(
                          tag: 'search-hero',
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Palette.buttonBG,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              height: 50.h,
                              child: Row(
                                children: [
                                  Icon(
                                    PhosphorIconsBold.magnifyingGlass,
                                    color: Palette.whiteColor.withOpacity(0.5),
                                    size: 25.h,
                                  ),
                                  SizedBox(width: 15.w),
                                  "Search Vehicle".txt14(fontW: F.w6),
                                ],
                              ),
                            ),
                          ),
                        ).gestureTap(onTap: () {
                          _videoController.pause();
                          goToUnanimated(
                              context: context, view: VehicleSearchView());
                        })),
                    20.sbH,
                    FlutterCarousel(
                      items: List.generate(10, (index) {
                        if (index % 2 == 0) {
                          // Even index, show video
                          return Padding(
                            padding: 20.padH,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: SizedBox(
                                width: double.infinity,
                                height: 190.h,
                                child: _videoController.value.isInitialized
                                    ? FittedBox(
                                        fit: BoxFit.cover,
                                        child: SizedBox(
                                          width:
                                              _videoController.value.size.width,
                                          height: _videoController
                                              .value.size.height,
                                          child: VideoPlayer(_videoController),
                                        ),
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                              ).tap(onTap: () {
                                if (_videoController.value.isPlaying) {
                                  _videoController.pause();
                                } else {
                                  _videoController.play();
                                }
                              }),
                            ),
                          );
                        } else {
                          // Odd index, show ad
                          return Padding(
                            padding: 20.padH,
                            child: const AdDisplayCard(),
                          );
                        }
                      }),
                      options: CarouselOptions(
                        physics: const NeverScrollableScrollPhysics(),
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 30),
                        viewportFraction: 1.0,
                        initialPage: 0,
                        showIndicator: false,
                        height: 190.h,
                        onPageChanged:
                            (int index, CarouselPageChangedReason reason) {
                          _currentIndexNotifier.value = index;
                          if (index % 2 == 0) {
                            // Video is in view, resume playback
                            _videoController.play();
                          } else {
                            // Video is not in view, pause playback
                            _videoController.pause();
                          }
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
                      const Tab(text: "All"),
                      ...vehicleTypes.asMap().entries.map((entry) {
                        String vehicleClass = entry.value;
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
          body: TabBarView(
            children: [
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
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
                            onTileTap: () {
                              _videoController.pause();
                              goTo(
                                  context: context,
                                  view: FullVehicleRentalDetailsView());
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
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 15.w),
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
                                filteredRentalSelection[index];
                            return RentalDisplayCard(
                              carImagePath: rentalCardDisplay.carImagePath,
                              manufacturerName:
                                  rentalCardDisplay.manufacturerName,
                              modelName: rentalCardDisplay.modelName,
                              reviewStarCount:
                                  rentalCardDisplay.reviewCountAverage,
                              onTileTap: () {
                                _videoController.pause();
                                goTo(
                                    context: context,
                                    view: FullVehicleRentalDetailsView());
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
          )),
    );
  }
}
