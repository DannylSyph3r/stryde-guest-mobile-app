import 'dart:math';
import 'package:stryde_guest_app/shared/app_graphics.dart';

class AirportVehicleSelection {
  final String carImagePath;
  final String manufacturerName;
  final String modelName;
  final String vehicleCategory;
  final String vehicleSubCategory;
  final String vehicleYear;
  final int seatCount;
  final int rentalRate;

  AirportVehicleSelection({
    required this.carImagePath,
    required this.manufacturerName,
    required this.modelName,
    required this.vehicleCategory,
    required this.vehicleSubCategory,
    required this.vehicleYear,
    required this.seatCount,
    required this.rentalRate,
  });
}

final _random = Random();

String getRandomCarImage() {
  final carImages = [
    AppGraphics.carPlOne,
    AppGraphics.carPlTwo,
    AppGraphics.carPlThree,
  ];
  return carImages[_random.nextInt(carImages.length)];
}

int getRandomRentalRate() {
  return 50000 + _random.nextInt(49000);
}

int getRandomSeatCount() {
  List<int> seatCounts = [2, 4, 6, 8, 10];
  return seatCounts[_random.nextInt(seatCounts.length)];
}

String getRandomVehicleYear() {
  return (2006 + _random.nextInt(19)).toString();
}

List<AirportVehicleSelection> airportVehicleSelections = [
  // Executive - Sedan
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Mercedes-Benz",
    modelName: "S-Class",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Sedan",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Audi",
    modelName: "A8",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Sedan",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Executive - SUV
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "BMW",
    modelName: "X7",
    vehicleCategory: "Executive",
    vehicleSubCategory: "SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 7,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Tesla",
    modelName: "Model X",
    vehicleCategory: "Executive",
    vehicleSubCategory: "SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 7,
    rentalRate: getRandomRentalRate(),
  ),
  // Executive - Van
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Mercedes-Benz",
    modelName: "V-Class",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Van",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 8,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Chrysler",
    modelName: "Pacifica",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Van",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 8,
    rentalRate: getRandomRentalRate(),
  ),
  // Executive - Elite
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Rolls-Royce",
    modelName: "Phantom",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Elite",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Bentley",
    modelName: "Continental GT",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Elite",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 4,
    rentalRate: getRandomRentalRate(),
  ),
  // Executive - Armored
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "BMW",
    modelName: "X5 Security Plus",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Armored",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Mercedes-Benz",
    modelName: "S-Class Guard",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Armored",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Performance - Sedan
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "BMW",
    modelName: "M5",
    vehicleCategory: "Performance",
    vehicleSubCategory: "Sedan",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Audi",
    modelName: "RS7",
    vehicleCategory: "Performance",
    vehicleSubCategory: "Sedan",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Performance - SUV
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Porsche",
    modelName: "Cayenne Turbo",
    vehicleCategory: "Performance",
    vehicleSubCategory: "SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Jeep",
    modelName: "Grand Cherokee Trackhawk",
    vehicleCategory: "Performance",
    vehicleSubCategory: "SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Performance - Elite SUV
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Lamborghini",
    modelName: "Urus",
    vehicleCategory: "Performance",
    vehicleSubCategory: "Elite SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Bentley",
    modelName: "Bentayga",
    vehicleCategory: "Performance",
    vehicleSubCategory: "Elite SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Coupes & Convertibles - Elite
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Ferrari",
    modelName: "488 Spider",
    vehicleCategory: "Coupes & Convertibles",
    vehicleSubCategory: "Elite",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 2,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Lamborghini",
    modelName: "Aventador",
    vehicleCategory: "Coupes & Convertibles",
    vehicleSubCategory: "Elite",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 2,
    rentalRate: getRandomRentalRate(),
  ),
  // Utility - Pick-up Truck
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Ford",
    modelName: "F-150",
    vehicleCategory: "Utility",
    vehicleSubCategory: "Pick-up Truck",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 6,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Chevrolet",
    modelName: "Silverado",
    vehicleCategory: "Utility",
    vehicleSubCategory: "Pick-up Truck",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 6,
    rentalRate: getRandomRentalRate(),
  ),
  // Utility - Mini-Van
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Honda",
    modelName: "Odyssey",
    vehicleCategory: "Utility",
    vehicleSubCategory: "Mini-Van",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 8,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Toyota",
    modelName: "Sienna",
    vehicleCategory: "Utility",
    vehicleSubCategory: "Mini-Van",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 8,
    rentalRate: getRandomRentalRate(),
  ),
  // Utility - Bus
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Mercedes-Benz",
    modelName: "Sprinter",
    vehicleCategory: "Utility",
    vehicleSubCategory: "Bus",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 15,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Ford",
    modelName: "Transit",
    vehicleCategory: "Utility",
    vehicleSubCategory: "Bus",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 15,
    rentalRate: getRandomRentalRate(),
  ),
  // Comfort - Sedan
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Toyota",
    modelName: "Camry",
    vehicleCategory: "Comfort",
    vehicleSubCategory: "Sedan",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Honda",
    modelName: "Accord",
    vehicleCategory: "Comfort",
    vehicleSubCategory: "Sedan",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Comfort - SUV
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Honda",
    modelName: "CR-V",
    vehicleCategory: "Comfort",
    vehicleSubCategory: "SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Mazda",
    modelName: "CX-5",
    vehicleCategory: "Comfort",
    vehicleSubCategory: "SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Comfort - Hatch-Back
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Volkswagen",
    modelName: "Golf",
    vehicleCategory: "Comfort",
    vehicleSubCategory: "Hatch-Back",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Ford",
    modelName: "Focus",
    vehicleCategory: "Comfort",
    vehicleSubCategory: "Hatch-Back",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Comfort - Station wagon
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Volvo",
    modelName: "V90",
    vehicleCategory: "Comfort",
    vehicleSubCategory: "Station wagon",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Subaru",
    modelName: "Outback",
    vehicleCategory: "Comfort",
    vehicleSubCategory: "Station wagon",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Lexus",
    modelName: "LS",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Sedan",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Executive - SUV
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Range Rover",
    modelName: "Autobiography",
    vehicleCategory: "Executive",
    vehicleSubCategory: "SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Executive - Van
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Toyota",
    modelName: "Alphard",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Van",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 7,
    rentalRate: getRandomRentalRate(),
  ),
  // Executive - Elite
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Maybach",
    modelName: "S650",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Elite",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 4,
    rentalRate: getRandomRentalRate(),
  ),
  // Executive - Armored
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Audi",
    modelName: "A8 L Security",
    vehicleCategory: "Executive",
    vehicleSubCategory: "Armored",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Performance - Sedan
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Mercedes-AMG",
    modelName: "E63 S",
    vehicleCategory: "Performance",
    vehicleSubCategory: "Sedan",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Performance - SUV
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Alfa Romeo",
    modelName: "Stelvio Quadrifoglio",
    vehicleCategory: "Performance",
    vehicleSubCategory: "SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Performance - Elite SUV
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Aston Martin",
    modelName: "DBX",
    vehicleCategory: "Performance",
    vehicleSubCategory: "Elite SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Coupes & Convertibles - Elite
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "McLaren",
    modelName: "720S Spider",
    vehicleCategory: "Coupes & Convertibles",
    vehicleSubCategory: "Elite",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 2,
    rentalRate: getRandomRentalRate(),
  ),
  // Utility - Pick-up Truck
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Ram",
    modelName: "1500",
    vehicleCategory: "Utility",
    vehicleSubCategory: "Pick-up Truck",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 6,
    rentalRate: getRandomRentalRate(),
  ),
  // Utility - Mini-Van
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Kia",
    modelName: "Carnival",
    vehicleCategory: "Utility",
    vehicleSubCategory: "Mini-Van",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 8,
    rentalRate: getRandomRentalRate(),
  ),
  // Utility - Bus
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Volkswagen",
    modelName: "Crafter",
    vehicleCategory: "Utility",
    vehicleSubCategory: "Bus",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 15,
    rentalRate: getRandomRentalRate(),
  ),
  // Comfort - Sedan
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Hyundai",
    modelName: "Sonata",
    vehicleCategory: "Comfort",
    vehicleSubCategory: "Sedan",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Comfort - SUV
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Nissan",
    modelName: "Rogue",
    vehicleCategory: "Comfort",
    vehicleSubCategory: "SUV",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
  // Comfort - Hatch-Back
  AirportVehicleSelection(
    carImagePath: getRandomCarImage(),
    manufacturerName: "Toyota",
    modelName: "Corolla Hatchback",
    vehicleCategory: "Comfort",
    vehicleSubCategory: "Hatch-Back",
    vehicleYear: getRandomVehicleYear(),
    seatCount: 5,
    rentalRate: getRandomRentalRate(),
  ),
];
