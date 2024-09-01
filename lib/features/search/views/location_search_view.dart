import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/airport/providers/airport_providers.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/text_input.dart';

class LocationSearchView extends ConsumerStatefulWidget {
  final bool isStartingLocation;
  const LocationSearchView({required this.isStartingLocation, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LocationSearchViewState();
}

class _LocationSearchViewState extends ConsumerState<LocationSearchView> {
  final TextEditingController _locationSearchFieldController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: 15.padH,
        child: Column(
          children: [
            40.sbH,
            Row(
              children: [
                const Icon(Icons.close).tap(onTap: () {
                  goBack(context);
                }),
                5.sbW,
                Expanded(
                  child: Hero(
                    tag: widget.isStartingLocation
                        ? 'startingLocationTag'
                        : 'airportTag',
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextInputWidget(
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
                          hintText: "Search Location",
                          controller: _locationSearchFieldController,
                          onFieldSubmitted: (string) {
                            widget.isStartingLocation
                                ? ref
                                    .read(startingLocationProvider.notifier)
                                    .state = string
                                : ref
                                    .read(desinationLocationProvider.notifier)
                                    .state = string;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
