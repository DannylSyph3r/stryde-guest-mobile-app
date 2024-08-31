import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/search/views/filter_settings_view.dart';
import 'package:stryde_guest_app/features/vehicles/models/rental_selection_model.dart';
import 'package:stryde_guest_app/features/vehicles/views/full_vehicle_rental_details_view.dart';
import 'package:stryde_guest_app/features/vehicles/widgets/rental_display_card.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/text_input.dart';

class VehicleSearchView extends ConsumerStatefulWidget {
  const VehicleSearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VehicleSearchViewState();
}

class _VehicleSearchViewState extends ConsumerState<VehicleSearchView> {
  final TextEditingController _searchFieldController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final ValueNotifier _locationToggle = false.notifier;
  final ValueNotifier _fieldActiveNotifier = false.notifier;
  List<String> carBrands = [
    "Toyota",
    "Honda",
    "Ford",
    "Chevrolet",
    "BMW",
    "Mercedes-Benz",
    "Nissan",
    "Volkswagen",
    "Audi",
    "Hyundai"
  ];

  @override
  void initState() {
    super.initState();
    // Add a listener to the FocusNode to detect changes
    _searchFocusNode.addListener(() {
      if (_searchFocusNode.hasFocus) {
        _fieldActiveNotifier.value = true;
      } else {
        // _fieldActiveNotifier.value = false;
      }
    });
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    _searchFocusNode.dispose();
    _locationToggle.dispose();
    _fieldActiveNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fieldActiveNotifier.sync(builder: (context, fieldActive, child) {
        return ListView(
          padding: fieldActive
              ? EdgeInsets.symmetric(vertical: 45.h, horizontal: 0.w)
              : EdgeInsets.symmetric(vertical: 45.h, horizontal: 15.w),
          children: [
            Column(
              children: [
                Padding(
                  padding: fieldActive ? 15.padH : 0.0.padA,
                  child: Row(
                    children: [
                      Icon(fieldActive ? Icons.close : Icons.arrow_back).tap(
                          onTap: () {
                        fieldActive
                            ? _fieldActiveNotifier.value = false
                            : goBack(context);
                      }),
                      5.sbW,
                      Expanded(
                        child: Hero(
                          tag: 'search-hero',
                          child: Material(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextInputWidget(
                                focusNode: _searchFocusNode,
                                height: 50.h,
                                radiusValue: 25.r,
                                prefix: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Icon(
                                    PhosphorIconsBold.magnifyingGlass,
                                    color: Palette.strydeOrange,
                                    size: 23.h,
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: 15.padH,
                                  child: Visibility(
                                    visible: fieldActive,
                                    child: Icon(PhosphorIconsFill.funnel,
                                            size: 22.h,
                                            color: Palette.strydeOrange)
                                        .tap(onTap: () {
                                      goTo(
                                          context: context,
                                          view: FilterSettingsView());
                                    }),
                                  ),
                                ),
                                hintText: "Search Vehicle",
                                controller: _searchFieldController,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                !fieldActive
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.sbH,
                          _locationToggle.sync(
                              builder: (context, locationActive, child) {
                            return Container(
                              padding: 12.0.padA,
                              width: 120.w,
                              decoration: BoxDecoration(
                                  color: locationActive
                                      ? Palette.strydeOrange
                                      : Palette.buttonBG,
                                  borderRadius: BorderRadius.circular(25.r)),
                              child: Row(children: [
                                Icon(
                                  PhosphorIconsFill.mapPin,
                                  size: 23.h,
                                  color: locationActive
                                      ? Palette.whiteColor
                                      : Palette.strydeOrange,
                                ),
                                5.sbW,
                                "Location".txt16(),
                              ]),
                            ).tap(onTap: () {
                              _locationToggle.value = !_locationToggle.value;
                            });
                          }),
                          20.sbH,
                          Row(
                            children: [
                              Icon(PhosphorIconsFill.hourglassMedium,
                                  size: 25.h, color: Palette.strydeOrange),
                              5.sbW,
                              "History".txt18(fontW: F.w6),
                            ],
                          ),
                          10.sbH,
                          Wrap(
                              spacing: 5.w,
                              runSpacing: 10.h,
                              children:
                                  List.generate(carBrands.length, (index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.w, vertical: 9.h),
                                  decoration: BoxDecoration(
                                      color: Palette.buttonBG,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(27.r))),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      carBrands[index].txt14(),
                                    ],
                                  ),
                                );
                              })),
                          30.sbH,
                          Row(
                            children: [
                              Icon(PhosphorIconsFill.flame,
                                  size: 25.h, color: Palette.strydeOrange),
                              5.sbW,
                              "Trending".txt18(fontW: F.w6),
                            ],
                          ),
                          10.sbH,
                          Wrap(
                              spacing: 5.w,
                              runSpacing: 10.h,
                              children:
                                  List.generate(carBrands.length, (index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.w, vertical: 9.h),
                                  decoration: BoxDecoration(
                                      color: Palette.buttonBG,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(27.r))),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      carBrands[index].txt14(),
                                    ],
                                  ),
                                );
                              })),
                        ],
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        padding: 15.padV,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.w,
                          mainAxisSpacing: 20.h,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: rentalSelections.length,
                        itemBuilder: (context, index) {
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
                                goTo(
                                    context: context,
                                    view: FullVehicleRentalDetailsView());
                              },
                              onLikeTap: () {});
                        },
                      ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
