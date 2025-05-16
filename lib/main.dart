import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const BikeRentalApp());
}

class BikeRentalApp extends StatelessWidget {
  const BikeRentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike Rental',
      debugShowCheckedModeBanner: false, // Moved to correct position
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}