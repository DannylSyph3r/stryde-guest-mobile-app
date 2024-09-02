class Trip {
  final String startingLocation;
  final String destinationLocation;
  final String dateOfTrip;
  final String vehicleClass;
  final String tripAmount;

  Trip({
    required this.startingLocation,
    required this.destinationLocation,
    required this.dateOfTrip,
    required this.vehicleClass,
    required this.tripAmount,
  });
}

List<Trip> trips = [
  Trip(
    startingLocation: "New York",
    destinationLocation: "Boston",
    dateOfTrip: DateTime.now().subtract(const Duration(days: 6)).toString(),
    vehicleClass: "Sedan",
    tripAmount: "55,000",
  ),
  Trip(
    startingLocation: "San Francisco",
    destinationLocation: "Seattle",
    dateOfTrip:
        DateTime.now().subtract(const Duration(days: 6, hours: 4)).toString(),
    vehicleClass: "SUV",
    tripAmount: "70,000",
  ),

  // Trips from 5 days ago
  Trip(
    startingLocation: "San Francisco",
    destinationLocation: "Los Angeles",
    dateOfTrip: DateTime.now().subtract(const Duration(days: 5)).toString(),
    vehicleClass: "SUV",
    tripAmount: "120,000",
  ),
  Trip(
    startingLocation: "Chicago",
    destinationLocation: "Indianapolis",
    dateOfTrip:
        DateTime.now().subtract(const Duration(days: 5, hours: 3)).toString(),
    vehicleClass: "Sedan",
    tripAmount: "80,000",
  ),

  // Trips from 4 days ago
  Trip(
    startingLocation: "Houston",
    destinationLocation: "Dallas",
    dateOfTrip: DateTime.now().subtract(const Duration(days: 4)).toString(),
    vehicleClass: "Sedan",
    tripAmount: "85,000",
  ),
  Trip(
    startingLocation: "Miami",
    destinationLocation: "Orlando",
    dateOfTrip:
        DateTime.now().subtract(const Duration(days: 4, hours: 2)).toString(),
    vehicleClass: "SUV",
    tripAmount: "90,000",
  ),

  // Trips from 3 days ago
  Trip(
    startingLocation: "Miami",
    destinationLocation: "Tampa",
    dateOfTrip: DateTime.now().subtract(const Duration(days: 3)).toString(),
    vehicleClass: "SUV",
    tripAmount: "95,000",
  ),
  Trip(
    startingLocation: "Chicago",
    destinationLocation: "Milwaukee",
    dateOfTrip:
        DateTime.now().subtract(const Duration(days: 3, hours: 5)).toString(),
    vehicleClass: "Sedan",
    tripAmount: "70,000",
  ),

  // Trips from 2 days ago
  Trip(
    startingLocation: "Seattle",
    destinationLocation: "Portland",
    dateOfTrip: DateTime.now().subtract(const Duration(days: 2)).toString(),
    vehicleClass: "SUV",
    tripAmount: "150,000",
  ),
  Trip(
    startingLocation: "Dallas",
    destinationLocation: "Austin",
    dateOfTrip:
        DateTime.now().subtract(const Duration(days: 2, hours: 6)).toString(),
    vehicleClass: "Sedan",
    tripAmount: "80,000",
  ),

  // Trips from 1 day ago
  Trip(
    startingLocation: "Atlanta",
    destinationLocation: "Charlotte",
    dateOfTrip: DateTime.now().subtract(const Duration(days: 1)).toString(),
    vehicleClass: "Sedan",
    tripAmount: "200,000",
  ),
  Trip(
    startingLocation: "Las Vegas",
    destinationLocation: "Phoenix",
    dateOfTrip:
        DateTime.now().subtract(const Duration(days: 1, hours: 4)).toString(),
    vehicleClass: "SUV",
    tripAmount: "250,000",
  ),

  // Trips from today
  Trip(
    startingLocation: "Denver",
    destinationLocation: "Salt Lake City",
    dateOfTrip: DateTime.now().toString(),
    vehicleClass: "Sedan",
    tripAmount: "90,000",
  ),
  Trip(
    startingLocation: "Philadelphia",
    destinationLocation: "Washington, D.C.",
    dateOfTrip: DateTime.now().subtract(const Duration(hours: 3)).toString(),
    vehicleClass: "SUV",
    tripAmount: "130,000",
  ),
];
