import 'package:flutter/material.dart';

class PastTripsPage extends StatelessWidget {
  const PastTripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Trips'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildTripCard('Cyclex', '2 hours', '₹140', '2023-06-15'),
          const SizedBox(height: 15),
          _buildTripCard('Cycley', '1.5 hours', '₹135', '2023-06-10'),
          const SizedBox(height: 15),
          _buildTripCard('Cyclez', '3 hours', '₹360', '2023-05-28'),
        ],
      ),
    );
  }

  // Move _buildTripCard here
  Widget _buildTripCard(
      String cycleName, String duration, String cost, String date) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cycleName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.timer, size: 16),
                const SizedBox(width: 5),
                Text('Duration: $duration'),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.currency_rupee, size: 16),
                const SizedBox(width: 5),
                Text('Cost: $cost'),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 5),
                Text('Date: $date'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
