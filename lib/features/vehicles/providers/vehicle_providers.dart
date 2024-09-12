import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stryde_guest_app/features/vehicles/models/airport_vehicle_selection.dart';

final airportVehicleSelectionProvider = StateProvider<bool>((ref) => false);

class AirportVehicleState {
  final List<AirportVehicleSelection> vehicles;
  final String currentCategory;
  final String currentSubCategory;
  final bool isLoading;

  AirportVehicleState({
    required this.vehicles,
    required this.currentCategory,
    required this.currentSubCategory,
    this.isLoading = false,
  });

  AirportVehicleState copyWith({
    List<AirportVehicleSelection>? vehicles,
    String? currentCategory,
    String? currentSubCategory,
    bool? isLoading,
  }) {
    return AirportVehicleState(
      vehicles: vehicles ?? this.vehicles,
      currentCategory: currentCategory ?? this.currentCategory,
      currentSubCategory: currentSubCategory ?? this.currentSubCategory,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AirportVehicleNotifier extends StateNotifier<AirportVehicleState> {
  AirportVehicleNotifier()
      : super(AirportVehicleState(
          vehicles: airportVehicleSelections,
          currentCategory: 'All',
          currentSubCategory: 'All',
        ));

  Future<void> filterByCategory(String category) async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(
        const Duration(milliseconds: 300)); // Simulating network delay

    List<AirportVehicleSelection> filteredVehicles = category == 'All'
        ? airportVehicleSelections
        : airportVehicleSelections
            .where((vehicle) => vehicle.vehicleCategory == category)
            .toList();

    state = state.copyWith(
      vehicles: filteredVehicles,
      currentCategory: category,
      currentSubCategory: 'All',
      isLoading: false,
    );
  }

  Future<void> filterByCategoryAndSubCategory(
      String category, String subCategory) async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(
        const Duration(milliseconds: 300)); // Simulating network delay

    List<AirportVehicleSelection> filteredVehicles;

    if (category == 'All' && subCategory == 'All') {
      filteredVehicles = airportVehicleSelections;
    } else if (category == 'All') {
      filteredVehicles = airportVehicleSelections
          .where((vehicle) => vehicle.vehicleSubCategory == subCategory)
          .toList();
    } else if (subCategory == 'All') {
      filteredVehicles = airportVehicleSelections
          .where((vehicle) => vehicle.vehicleCategory == category)
          .toList();
    } else {
      filteredVehicles = airportVehicleSelections
          .where((vehicle) =>
              vehicle.vehicleCategory == category &&
              vehicle.vehicleSubCategory == subCategory)
          .toList();
    }

    state = state.copyWith(
      vehicles: filteredVehicles,
      currentCategory: category,
      currentSubCategory: subCategory,
      isLoading: false,
    );
  }
}

final airportVehicleProvider =
    StateNotifierProvider<AirportVehicleNotifier, AirportVehicleState>((ref) {
  return AirportVehicleNotifier();
});
