import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stryde_guest_app/features/vehicles/views/full_vehicle_rental_details_view.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/rentals_list.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/sliver_appbar.dart';

class RentalsView extends ConsumerStatefulWidget {
  const RentalsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RentalsViewState();
}

class _RentalsViewState extends ConsumerState<RentalsView> {
  @override
  Widget build(BuildContext context) {
    //final garageListPopulator = ref.watch(garageListProvider);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
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
                title: "Rentals",
                titleFontSize: 20.sp,
                titleFontWeight: FontWeight.w100,
                sliverBottom: AppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 0,
                  toolbarHeight: 60.h,
                  title: TabBar(
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
                      Tab(
                        child: SizedBox(
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Active".txt(size: 14.sp),
                              // 5.sbW,
                              // "8".txt(
                              //     size: 14.sp,
                              //     color: Palette.strydeOrange,
                              //     fontW: F.w6),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "History".txt(size: 14.sp),
                              // 5.sbW,
                              // "5".txt(
                              //     size: 14.sp,
                              //     color: Palette.strydeOrange),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ];
          },
          body: TabBarView(children: [
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: 10.padV,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return RentalList(
                    vehicleBrandName: "Mercedes Benz",
                    vehicleLocation: "Lagos",
                    vehicleModel: "GLK",
                    vehicleTrim: "GLK 4L",
                    rentalRate: "₦250,000 / day",
                    onRentalListTap: () {
                      goTo(context: context, view: FullVehicleRentalDetailsView());
                    },
                  );
                }),
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: 10.padV,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return RentalList(
                    vehicleBrandName: "Mercedes Benz",
                    vehicleLocation: "Lagos",
                    vehicleModel: "GLK",
                    vehicleTrim: "GLK 4L",
                    rentalRate: "₦250,000 / day",
                    onRentalListTap: () {
                      goTo(context: context, view: FullVehicleRentalDetailsView());
                    },
                  );
                }),
          ]),
        ),
      ),
    );
  }
}
