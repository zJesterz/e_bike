import 'package:flutter/material.dart';

Widget buildCycleCard(
  BuildContext context,
  String name,
  String price,
  IconData icon,
  VoidCallback onRentPressed,
) {
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
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(price, style: TextStyle(color: Colors.green)),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: onRentPressed,
                child: const Text('Rent Now'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}