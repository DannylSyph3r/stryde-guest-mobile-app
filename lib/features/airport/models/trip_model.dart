class Trip {
  final String startingLocation;
  final String destinationLocation;
  final DateTime startTime;
  final DateTime endTime;
  final String vehicleClass;
  final String tripAmount;

  Trip({
    required this.startingLocation,
    required this.destinationLocation,
    required this.startTime,
    required this.endTime,
    required this.vehicleClass,
    required this.tripAmount,
  });
}

List<Trip> trips = [
  // Trips in January
  Trip(
    startingLocation: "New York",
    destinationLocation: "Boston",
    startTime: DateTime(2024, 1, 14, 8),
    endTime: DateTime(2024, 1, 14, 10),
    vehicleClass: "Sedan",
    tripAmount: "55,000",
  ),
  Trip(
    startingLocation: "San Francisco",
    destinationLocation: "Seattle",
    startTime: DateTime(2024, 1, 20, 14),
    endTime: DateTime(2024, 1, 20, 17),
    vehicleClass: "SUV (Sport Utility Vehicle)",
    tripAmount: "70,000",
  ),

  // Trips in February
  Trip(
    startingLocation: "Los Angeles",
    destinationLocation: "San Diego",
    startTime: DateTime(2024, 2, 10, 9),
    endTime: DateTime(2024, 2, 10, 11),
    vehicleClass: "Convertible",
    tripAmount: "85,000",
  ),
  Trip(
    startingLocation: "Chicago",
    destinationLocation: "Indianapolis",
    startTime: DateTime(2024, 2, 22, 13),
    endTime: DateTime(2024, 2, 22, 15),
    vehicleClass: "Coupe",
    tripAmount: "80,000",
  ),

  // Trips in March
  Trip(
    startingLocation: "Houston",
    destinationLocation: "Dallas",
    startTime: DateTime(2024, 3, 5, 8),
    endTime: DateTime(2024, 3, 5, 10),
    vehicleClass: "Hatchback",
    tripAmount: "75,000",
  ),
  Trip(
    startingLocation: "Miami",
    destinationLocation: "Orlando",
    startTime: DateTime(2024, 3, 18, 11),
    endTime: DateTime(2024, 3, 18, 13),
    vehicleClass: "Station Wagon",
    tripAmount: "90,000",
  ),
  Trip(
    startingLocation: "Phoenix",
    destinationLocation: "Las Vegas",
    startTime: DateTime(2024, 3, 27, 7),
    endTime: DateTime(2024, 3, 27, 10),
    vehicleClass: "Crossover",
    tripAmount: "95,000",
  ),

  // Trips in April
  Trip(
    startingLocation: "San Antonio",
    destinationLocation: "Austin",
    startTime: DateTime(2024, 4, 8, 9),
    endTime: DateTime(2024, 4, 8, 11),
    vehicleClass: "Minivan",
    tripAmount: "85,000",
  ),
  Trip(
    startingLocation: "Seattle",
    destinationLocation: "Portland",
    startTime: DateTime(2024, 4, 15, 6),
    endTime: DateTime(2024, 4, 15, 9),
    vehicleClass: "Van",
    tripAmount: "150,000",
  ),
  Trip(
    startingLocation: "Dallas",
    destinationLocation: "Houston",
    startTime: DateTime(2024, 4, 30, 12),
    endTime: DateTime(2024, 4, 30, 15),
    vehicleClass: "Pickup Truck",
    tripAmount: "80,000",
  ),

  // Trips in May
  Trip(
    startingLocation: "Atlanta",
    destinationLocation: "Charlotte",
    startTime: DateTime(2024, 5, 7, 10),
    endTime: DateTime(2024, 5, 7, 12),
    vehicleClass: "Microcar",
    tripAmount: "200,000",
  ),
  Trip(
    startingLocation: "Las Vegas",
    destinationLocation: "Phoenix",
    startTime: DateTime(2024, 5, 23, 13),
    endTime: DateTime(2024, 5, 23, 16),
    vehicleClass: "Roadster",
    tripAmount: "250,000",
  ),

  // Trips in June
  Trip(
    startingLocation: "Denver",
    destinationLocation: "Salt Lake City",
    startTime: DateTime(2024, 6, 5, 7),
    endTime: DateTime(2024, 6, 5, 9),
    vehicleClass: "Panel Van",
    tripAmount: "90,000",
  ),
  Trip(
    startingLocation: "Philadelphia",
    destinationLocation: "Washington, D.C.",
    startTime: DateTime(2024, 6, 18, 14),
    endTime: DateTime(2024, 6, 18, 17),
    vehicleClass: "Off-Road Vehicle",
    tripAmount: "130,000",
  ),

  // Trips in July
  Trip(
    startingLocation: "New York",
    destinationLocation: "Boston",
    startTime: DateTime(2024, 7, 12, 8),
    endTime: DateTime(2024, 7, 12, 10),
    vehicleClass: "Military Vehicle",
    tripAmount: "160,000",
  ),
  Trip(
    startingLocation: "San Francisco",
    destinationLocation: "Seattle",
    startTime: DateTime(2024, 7, 25, 14),
    endTime: DateTime(2024, 7, 25, 17),
    vehicleClass: "RV (Recreational Vehicle)",
    tripAmount: "140,000",
  ),

  // Trips in August
  Trip(
    startingLocation: "Los Angeles",
    destinationLocation: "San Diego",
    startTime: DateTime(2024, 8, 10, 9),
    endTime: DateTime(2024, 8, 10, 11),
    vehicleClass: "Limousine",
    tripAmount: "185,000",
  ),
  Trip(
    startingLocation: "Chicago",
    destinationLocation: "Indianapolis",
    startTime: DateTime(2024, 8, 22, 13),
    endTime: DateTime(2024, 8, 22, 15),
    vehicleClass: "Box Truck",
    tripAmount: "80,000",
  ),

  // Trips in September
  Trip(
    startingLocation: "Houston",
    destinationLocation: "Dallas",
    startTime: DateTime(2024, 9, 6, 8),
    endTime: DateTime(2024, 9, 6, 10),
    vehicleClass: "Sedan",
    tripAmount: "85,000",
  ),
  Trip(
    startingLocation: "Miami",
    destinationLocation: "Orlando",
    startTime: DateTime(2024, 9, 19, 11),
    endTime: DateTime(2024, 9, 19, 13),
    vehicleClass: "SUV (Sport Utility Vehicle)",
    tripAmount: "90,000",
  ),
  Trip(
    startingLocation: "Phoenix",
    destinationLocation: "Las Vegas",
    startTime: DateTime(2024, 9, 27, 7),
    endTime: DateTime(2024, 9, 27, 10),
    vehicleClass: "Convertible",
    tripAmount: "95,000",
  ),
];
