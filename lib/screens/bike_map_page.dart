// lib/screens/bike_map_page.dart
import 'package:flutter/material.dart';
import '../models/cycle.dart';
import '../widgets/bike_map.dart';

class BikeMapPage extends StatefulWidget {
  final List<Cycle> cycles;
  
  const BikeMapPage({super.key, required this.cycles});

  @override
  State<BikeMapPage> createState() => _BikeMapPageState();
}

class _BikeMapPageState extends State<BikeMapPage> {
  late double _centerLat;
  late double _centerLng;
  double _zoom = 15.0;
  Cycle? _selectedBike;

  @override
  void initState() {
    super.initState();
    _calculateCenter();
  }

  void _calculateCenter() {
    _centerLat = widget.cycles
        .map((c) => c.location.latitude)
        .reduce((a, b) => a + b) / widget.cycles.length;
    
    _centerLng = widget.cycles
        .map((c) => c.location.longitude)
        .reduce((a, b) => a + b) / widget.cycles.length;
  }

  void _handleZoomIn() => setState(() => _zoom += 1);
  void _handleZoomOut() => setState(() => _zoom = _zoom > 1 ? _zoom - 1 : 1);
  void _handleBikeSelect(Cycle bike) => setState(() => _selectedBike = bike);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bike Locations'),
        actions: [
          IconButton(onPressed: _handleZoomIn, icon: const Icon(Icons.zoom_in)),
          IconButton(onPressed: _handleZoomOut, icon: const Icon(Icons.zoom_out)),
        ],
      ),
      body: Stack(
        children: [
          BikeMap(
            cycles: widget.cycles,
            centerLat: _centerLat,
            centerLng: _centerLng,
            zoom: _zoom,
            onBikeTap: _handleBikeSelect,
          ),
          if (_selectedBike != null) _buildBikeInfoCard(),
        ],
      ),
    );
  }

  Widget _buildBikeInfoCard() {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _selectedBike!.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text('Price: ₹${_selectedBike!.pricePerHour}/hour'),
              Text('Location: ${_selectedBike!.location.name}'),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => _showRentDialog(context),
                  child: const Text('Rent Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Rent ${_selectedBike!.name}'),
        content: Text('Confirm rental at ${_selectedBike!.location.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${_selectedBike!.name} rented!')),
              );
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}