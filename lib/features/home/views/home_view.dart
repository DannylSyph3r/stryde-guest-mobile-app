import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stryde_guest_app/features/airport/views/home_airport_view.dart';
import 'package:stryde_guest_app/features/home/views/home_rentals_view.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

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
    // final vehicleTypes = ref.watch(vehicleTypeSelectionProvider);
    return Scaffold(
        body: _pageBuilderNotifier.sync(builder: (context, currentPage, child) {
      if (currentPage == 0) {
        return HomeRentalsView(
          switcherNotifier: _pageBuilderNotifier,
        );
      } else {
        return HomeAirportView(switcherNotifier: _pageBuilderNotifier);
      }
    }));
  }
}
