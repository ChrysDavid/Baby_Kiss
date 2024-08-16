import 'package:babikiss/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

// ignore: must_be_immutable
class MaPosition extends StatefulWidget {
  MaPosition({super.key, this.currentLocation, required this.mapController, required this.markers});

  LatLng? currentLocation;
  MapController mapController;
  List<Marker> markers;

  @override
  State<MaPosition> createState() => _MaPositionState();
}

class _MaPositionState extends State<MaPosition> {
  @override
  Widget build(BuildContext context) {
    return Align(
            alignment: Alignment(0.98, 0.72),
            child: TextButton(
              onPressed: () async {
                Position position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high,
                );

                setState(() {
                  widget.currentLocation =
                      LatLng(position.latitude, position.longitude);
                  widget.mapController.move(widget.currentLocation!, 13.0);
                  widget.markers.add(
                    Marker(
                        width: 40.0,
                        height: 40.0,
                        point: widget.currentLocation!,
                        child: Icon(
                          Icons.location_on,
                          color: kPrimaryColor,
                          size: 50,
                        )),
                  );
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: kSecondaryColor)),
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Icon(
                    Icons.my_location,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          );
  }
}