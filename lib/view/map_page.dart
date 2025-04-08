import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});

  MapController controller = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(controller.camera.center);
        },
      ),
      body: FlutterMap(
        mapController: controller,
        options: MapOptions(
          initialCenter: LatLng(33.513, 36.292), // Center the map over London
          initialZoom: 9.2,
        ),
        children: [
          TileLayer(
            // Bring your own tiles
            urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
            userAgentPackageName: 'com.example.app', // Add your app identifier
            // And many more recommended properties!
          ),
          RichAttributionWidget(
            // Include a stylish prebuilt attribution widget that meets all requirments
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () {}, // (external)
              ),

              // Also add images...
            ],
          ),
        ],
      ),
    );
  }
}
