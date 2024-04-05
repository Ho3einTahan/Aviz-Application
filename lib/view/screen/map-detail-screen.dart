import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../widget/step-progress-indicator.dart';

class MapDetailScreen extends StatefulWidget {
  const MapDetailScreen({Key? key}) : super(key: key);

  @override
  State<MapDetailScreen> createState() => _MapDetailScreenState();
}

class _MapDetailScreenState extends State<MapDetailScreen> {
  late MapController _mapController = MapController();
  late LatLng _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  Future<void> _getCurrentPosition() async {
    final currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = LatLng(
        currentPosition.latitude,
        currentPosition.longitude,
      );
    });
  }

  void _onTapMap(LatLng tappedPoint) async {
    final latitude = tappedPoint.latitude.toString();
    final longitude = tappedPoint.longitude.toString();
    _currentPosition = tappedPoint;
    setState(() {});
    await fetchData(latitude, longitude);
  }

  Future<void> fetchData(String lat, String long) async {
    Response response = await Dio().get(
      'https://api.neshan.org/v5/reverse?lat=$lat&lng=$long',
      options: Options(
        headers: {
          'Api-Key': 'service.fa118e8276304266bd62784fd8ffee1d',
        },
      ),
    );

    if (response.statusCode == 200) {
      String? address = response.data['formatted_address'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace:
              StepProgressIndicatorWidget(currentStep: 3, context: context)),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: _currentPosition,
          zoom: 15,
          onTap: (tapPosition, point) => _onTapMap(point),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: _currentPosition,
                child: Container(
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
