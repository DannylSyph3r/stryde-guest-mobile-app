import 'package:flutter_riverpod/flutter_riverpod.dart';

class VehicleTypeSelectionNotifier extends StateNotifier<List<String>> {
  VehicleTypeSelectionNotifier()
      : super([
          "Sedan",
          "SUV (Sport Utility Vehicle)",
          "Coupes & Convertibles",
          "Mini-Van",
          "Van",
          "Pick-up Truck",
          "Bus",
          "Hatchback",
          "Station Wagon",
          "RV (Recreational Vehicle)",
          "Limousine"
        ]);
}

final vehicleTypeSelectionProvider =
    StateNotifierProvider<VehicleTypeSelectionNotifier, List<String>>(
  (ref) => VehicleTypeSelectionNotifier(),
);

class AirportVehicleTypeSelectionNotifier extends StateNotifier<List<String>> {
  AirportVehicleTypeSelectionNotifier()
      : super(['SUV', 'Sedan', 'Van', 'Armored', 'Elite']);
}

final airportVehicleTypeSelectionProvider =
    StateNotifierProvider<AirportVehicleTypeSelectionNotifier, List<String>>(
  (ref) => AirportVehicleTypeSelectionNotifier(),
);
