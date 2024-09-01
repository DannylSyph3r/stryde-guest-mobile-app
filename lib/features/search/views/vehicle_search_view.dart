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
        return Column(
          children: [
            SizedBox(height: 45.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Icon(fieldActive ? Icons.close : Icons.arrow_back).tap(
                    onTap: () {
                      fieldActive
                          ? _fieldActiveNotifier.value = false
                          : goBack(context);
                    },
                  ),
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
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                                        size: 22.h, color: Palette.strydeOrange)
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
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: fieldActive ? _buildActiveView() : _buildInactiveView(),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildInactiveView() {
    return ListView(
      key: ValueKey<bool>(false),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      children: [
        10.sbH,
        _locationToggle.sync(
          builder: (context, locationActive, child) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: 12.0.padA,
                decoration: BoxDecoration(
                  color:
                      locationActive ? Palette.strydeOrange : Palette.buttonBG,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      PhosphorIconsFill.mapPin,
                      size: 23.h,
                      color: locationActive
                          ? Palette.whiteColor
                          : Palette.strydeOrange,
                    ),
                    5.sbW,
                    "Location".txt16(),
                  ],
                ),
              ).tap(onTap: () {
                _locationToggle.value = !_locationToggle.value;
              }),
            );
          },
        ),
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
        _buildChipList(),
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
        _buildChipList(),
      ],
    );
  }

  Widget _buildActiveView() {
    return CustomScrollView(
      key: ValueKey<bool>(true),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(15.w),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                RentalSelection rentalCardDisplay = rentalSelections[index];
                return RentalDisplayCard(
                  carImagePath: rentalCardDisplay.carImagePath,
                  manufacturerName: rentalCardDisplay.manufacturerName,
                  modelName: rentalCardDisplay.modelName,
                  reviewStarCount: rentalCardDisplay.reviewCountAverage,
                  onTileTap: () {
                    goTo(
                        context: context, view: FullVehicleRentalDetailsView());
                  },
                  onLikeTap: () {},
                );
              },
              childCount: rentalSelections.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChipList() {
    return Wrap(
      spacing: 5.w,
      runSpacing: 10.h,
      children: List.generate(carBrands.length, (index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
          decoration: BoxDecoration(
            color: Palette.buttonBG,
            borderRadius: BorderRadius.all(Radius.circular(27.r)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              carBrands[index].txt14(),
            ],
          ),
        );
      }),
    );
  }
}
