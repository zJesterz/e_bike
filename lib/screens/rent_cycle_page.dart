import 'package:flutter/material.dart';

class RentCyclePage extends StatelessWidget {
  const RentCyclePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ... (Move all RentCyclePage code here)
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Available Electric Cycles'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildCycleCard(
              context, 'Cyclex', '₹70/hour', Icons.electric_bike),
          const SizedBox(height: 15),
          _buildCycleCard(context, 'Cycley', '₹90/hour', Icons.electric_bike),
          const SizedBox(height: 15),
          _buildCycleCard(
              context, 'Cyclez', '₹120/hour', Icons.electric_bike),
        ],
      ),
    );
  }
  
  // Move _buildCycleCard and _showRentConfirmation here
   Widget _buildCycleCard(
      BuildContext context, String name, String price, IconData icon) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 40),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 2, 158, 8),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    _showRentConfirmation(context, name, price);
                  },
                  child: const Text('Rent Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  void _showRentConfirmation(
      BuildContext context, String cycleName, String price) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Rental'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Electric Cycle: $cycleName'),
            Text('Price: $price'),
            const SizedBox(height: 10),
            const Text('Are you sure you want to rent this electric cycle?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Successfully rented $cycleName'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
