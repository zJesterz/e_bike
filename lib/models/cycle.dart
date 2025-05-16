// lib/models/cycle.dart
import 'location.dart'; // Import Location class

class Cycle {
  final String id;
  final String name;
  final Location location; // Non-nullable location
  final double pricePerHour;

  Cycle({
    required this.id,
    required this.name,
    required this.location, // Required ensures non-null
    this.pricePerHour = 70.0,
  });
}