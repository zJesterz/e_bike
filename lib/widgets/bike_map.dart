// lib/widgets/bike_map.dart
import 'package:flutter/material.dart';
import '../models/cycle.dart';

class BikeMap extends StatelessWidget {
  final List<Cycle> cycles;
  final double centerLat;
  final double centerLng;
  final double zoom;
  final Function(Cycle)? onBikeTap;

  const BikeMap({
    super.key,
    required this.cycles,
    required this.centerLat,
    required this.centerLng,
    this.zoom = 15.0,
    this.onBikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            _buildMapBackground(context),
            ...cycles.map((cycle) => _buildBikePin(cycle, constraints)),
          ],
        );
      },
    );
  }

  Widget _buildBikePin(Cycle cycle, BoxConstraints constraints) {
    final x = constraints.maxWidth * 0.5 + 
             (cycle.location.longitude - centerLng) * 10000 / zoom;
    final y = constraints.maxHeight * 0.5 - 
             (cycle.location.latitude - centerLat) * 10000 / zoom;

    return Positioned(
      left: x,
      top: y,
      child: GestureDetector(
        onTap: () => onBikeTap?.call(cycle),
        child: Icon(
          Icons.electric_bike,
          color: Colors.blue,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildMapBackground(BuildContext context) {
    return CustomPaint(
      painter: _MapPainter(
        centerLat: centerLat,
        centerLng: centerLng,
        zoom: zoom,
      ),
      child: Container(),
    );
  }
}

class _MapPainter extends CustomPainter {
  final double centerLat;
  final double centerLng;
  final double zoom;

  _MapPainter({required this.centerLat, required this.centerLng, required this.zoom});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw water background
    final waterPaint = Paint()..color = Colors.blue[50]!;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), waterPaint);

    // Draw land
    final landPaint = Paint()..color = Colors.green[100]!;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.4,
      landPaint,
    );

    // Draw roads
    final roadPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 3;
    
    // Horizontal road
    canvas.drawLine(
      Offset(0, size.height * 0.5),
      Offset(size.width, size.height * 0.5),
      roadPaint,
    );
    
    // Vertical road
    canvas.drawLine(
      Offset(size.width * 0.5, 0),
      Offset(size.width * 0.5, size.height),
      roadPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}