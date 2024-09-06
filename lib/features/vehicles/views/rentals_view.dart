import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stryde_guest_app/features/vehicles/views/full_vehicle_rental_details_view.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/rentals_list.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
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
  // Sample data for active rentals
  final List<Map<String, String>> activeRentals = [
    {
      'brandName': 'Mercedes Benz',
      'location': 'Lagos',
      'model': 'GLK',
      'trim': 'GLK 4L',
      'rate': '₦250,000 / day',
    },
    {
      'brandName': 'BMW',
      'location': 'Abuja',
      'model': 'X5',
      'trim': 'xDrive40i',
      'rate': '₦300,000 / day',
    },
    {
      'brandName': 'Audi',
      'location': 'Port Harcourt',
      'model': 'Q7',
      'trim': 'Premium Plus',
      'rate': '₦280,000 / day',
    },
  ];

  // Empty list for rental history
  final List<Map<String, String>> rentalHistory = [];

  @override
  Widget build(BuildContext context) {
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
            _buildRentalList(activeRentals),
            _buildRentalList(rentalHistory),
          ]),
        ),
      ),
    );
  }

  Widget _buildRentalList(List<Map<String, String>> rentals) {
    if (rentals.isEmpty) {
      return Center(child: AppGraphics.emptyRentals.png.myImage());
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: 10.padV,
      itemCount: rentals.length,
      itemBuilder: (context, index) {
        final rental = rentals[index];
        return RentalList(
          vehicleBrandName: rental['brandName'] ?? 'Unknown',
          vehicleLocation: rental['location'] ?? 'Unknown',
          vehicleModel: rental['model'] ?? 'Unknown',
          vehicleTrim: rental['trim'] ?? 'Unknown',
          rentalRate: rental['rate'] ?? 'Unknown',
          onRentalListTap: () {
            goTo(context: context, view: FullVehicleRentalDetailsView());
          },
        );
      },
    );
  }
}
