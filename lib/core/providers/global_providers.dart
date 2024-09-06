import 'package:flutter_riverpod/flutter_riverpod.dart';

class VehicleTypeSelectionNotifier extends StateNotifier<List<String>> {
  VehicleTypeSelectionNotifier()
      : super([
          "Sedan",
          "Coupe",
          "Convertible",
          "Hatchback",
          "Station Wagon",
          "SUV (Sport Utility Vehicle)",
          "Crossover",
          "Minivan",
          "Van",
          "Pickup Truck",
          "Microcar",
          "Roadster",
          "Panel Van",
          "Off-Road Vehicle",
          "Military Vehicle",
          "RV (Recreational Vehicle)",
          "Limousine",
          "Box Truck",
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
