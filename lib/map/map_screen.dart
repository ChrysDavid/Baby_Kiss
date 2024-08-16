import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:babikiss/constants.dart';
import 'package:babikiss/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';









class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.user});

  final User user;
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapController mapController;
  final double _originLatitude = 6.5212402, _originLongitude = 3.3679965;
  final double _destLatitude = 6.849660, _destLongitude = 3.648190;

  final List<Marker> markers = [];
  final List<Polyline> polylines = [];
  final List<LatLng> polylineCoordinates = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
    
  }

  void _initializeMarkers() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(position.latitude, position.longitude),
        child: Container(
          child: Icon(Icons.location_on, color: Colors.red, size: 40),
        ),
      ),
    );
    markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(_destLatitude, _destLongitude),
        child: Container(
          child: Icon(Icons.location_on, color: Colors.green, size: 40),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Map',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement search functionality
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
        body: 
        // Stack(
        //   children: [
            FlutterMap(
                options: MapOptions(
                  center: LatLng(_originLatitude, _originLongitude),
                  zoom: 15.0,
                  onMapEvent: (p0) => _onMapCreated,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: markers,
                  ),
                  PolylineLayer(
                    polylines: polylines,
                  ),
                ],
                nonRotatedChildren: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _getPolyline();
                      });
                    },
                    icon: Icon(Icons.call_end),
                  ),
                ]),
            // if (isLoading)
            //   Center(
            //     child: CircularProgressIndicator(),
            //   ),
          // ],
        // ),
      ),
    );
  }

  void _onMapCreated(MapController controller) {
    mapController = controller;
  }

  Future<void> _getPolyline() async {
    try {
      final String url =
          "http://router.project-osrm.org/route/v1/driving/$_originLongitude,$_originLatitude;$_destLongitude,$_destLatitude?overview=full&geometries=geojson";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['routes'] != null && data['routes'].isNotEmpty) {
          final List<dynamic> coordinates =
              data['routes'][0]['geometry']['coordinates'];

          setState(() {
            polylineCoordinates.clear();
            for (var coord in coordinates) {
              polylineCoordinates.add(LatLng(coord[1], coord[0]));
            }
            polylines.clear();
            polylines.add(
              Polyline(
                points: polylineCoordinates,
                strokeWidth: 4.0,
                color: Colors.blue,
              ),
            );
            isLoading = false;
          });
        } else {
          _showError("No routes found");
        }
      } else {
        _showError("Failed to fetch route data");
      }
    } catch (e) {
      _showError("An error occurred: $e");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}



















// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key, required this.user});

//   final User user;

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late MapController _mapController;
//   LatLng? _currentLocation;
//   List<Marker> _markers = [];
//   String _mapType = 'streets';
//   final String _mapTilerApiKey = 'Qs1TngL1aAPx6yvDs8Ry';
//   IconData? selectedIcon;
//   List<IconData> listIcons = [
//     Icons.directions_walk,
//     Icons.directions_bike,
//     Icons.directions_car,
//     Icons.directions_train,
//   ];

//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _mapController = MapController();
//     getLocationPermission();
//   }

//   void getLocationPermission() async {
//     final status = await Permission.location.request();
//     if (status.isGranted) {
//       setState(() {
//         getCurrentLocation();
//       });
//     } else {
//       setState(() {
//         print(status);
//       });
//     }
//   }

//   void getCurrentLocation() async {
//     // Position position = await Geolocator.getCurrentPosition(
//     //   desiredAccuracy: LocationAccuracy.high,
//     // );
//     setState(() {
//       _currentLocation = LatLng(
//           double.parse(widget.user.location.coordinates.lattitude),
//           double.parse(widget.user.location.coordinates.longitude));
//       _mapController.move(_currentLocation!, 13.0);
//       _markers.add(
//         Marker(
//           width: 40.0,
//           height: 40.0,
//           point: _currentLocation!,
//           child: customLocationIcon_1(widget.user),
//         ),
//       );
//     });
//   }

//   void _changeMapType(String mapType) {
//     setState(() {
//       _mapType = mapType;
//     });
//   }

//   void _navigateToCurrentLocation() {
//     if (_currentLocation != null) {
//       _mapController.move(_currentLocation!, 13.0);
//     }
//   }

//   void _nextPage() {
//     setState(() {
//       _currentPage++;
//       if (_currentPage >= listIcons.length) {
//         // Assuming you have 3 pages
//         _currentPage = 0;
//       }
//     });
//     _pageController.animateToPage(
//       _currentPage,
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeIn,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         backgroundColor: kPrimaryColor,
//         title: const Text(
//           'Map',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//             fontSize: 20,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // TODO: Implement search functionality
//             },
//             icon: Icon(Icons.search),
//           ),
//         ],
//       ),
//       body: FlutterMap(
//         mapController: _mapController,
//         options: MapOptions(
//           initialCenter: _currentLocation ?? LatLng(13, 15),
//           initialZoom: 10,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: getMapUrlTemplate(_mapType, _mapTilerApiKey),
//             additionalOptions: {
//               'key': _mapTilerApiKey,
//             },
//           ),
//           MarkerLayer(
//             markers: _markers,
//           ),
//         ],
//         nonRotatedChildren: [
//           TypeMapIconCustom(changeMapType: _changeMapType),
//           MaPosition(
//             mapController: _mapController,
//             markers: _markers,
//             currentLocation: _currentLocation,
//           )
//         ],
//       ),
//       floatingActionButton: ItineraitButtonCustom(user: widget.user,)
//     );
//   }
  
// }
