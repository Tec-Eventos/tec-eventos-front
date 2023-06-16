import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GooglePage extends StatefulWidget {
  const GooglePage({Key? key}) : super(key: key);

  @override
  State<GooglePage> createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-22.23353, -49.96519);

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(

        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
