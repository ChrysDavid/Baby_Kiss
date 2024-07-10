import 'package:babikiss/constants.dart';
import 'package:babikiss/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.user});

  final User user;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapController _mapController;
  LatLng? _currentLocation;
  List<Marker> _markers = [];
  bool _showCurrentLocation = false;
  String _mapType = 'streets';
  final String _mapTilerApiKey = 'Qs1TngL1aAPx6yvDs8Ry';
  final List<TypeCart> list_TypeCart = [
    TypeCart(
        nom: "Par défaut",
        image: 'assets/images/img_cart_par_defaut.png',
        id: 'streets'),
    TypeCart(
        nom: "Satellite",
        image: 'assets/images/img_cart_satellite.png',
        id: 'satellite'),
  ];

  TypeCart? selectedCart;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    getLocationPermission();
  }

  void getLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      setState(() {
        _showCurrentLocation = true;
        getCurrentLocation();
      });
    } else {
      setState(() {
        _showCurrentLocation = false;
      });
    }
  }

  void getCurrentLocation() async {
    // Position position = await Geolocator.getCurrentPosition(
    //   desiredAccuracy: LocationAccuracy.high,
    // );
    setState(() {
      _currentLocation = LatLng(
          double.parse(widget.user.location.coordinates.lattitude),
          double.parse(widget.user.location.coordinates.longitude));
      _mapController.move(_currentLocation!, 13.0);
      _showCurrentLocation = true;
      _markers.add(
        Marker(
          width: 40.0,
          height: 40.0,
          point: _currentLocation!,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor, width: 3),
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: NetworkImage(
                  widget.user.picture.large,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    });
  }

  void _navigateToCurrentLocation() {
    if (_currentLocation != null) {
      _mapController.move(_currentLocation!, 13.0);
    }
  }

  void _changeMapType(String mapType) {
    setState(() {
      _mapType = mapType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _currentLocation ?? LatLng(13, 15),
          initialZoom: 10,
        ),
        children: [
          TileLayer(
            urlTemplate: _getMapUrlTemplate(),
            additionalOptions: {
              'key': _mapTilerApiKey,
            },
          ),
          MarkerLayer(
            markers: _markers,
          ),
        ],
        nonRotatedChildren: [
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                  ),
                  child: TextButton(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.layers_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (BuildContext context, setState) {
                                  return FractionallySizedBox(
                                    heightFactor: 0.3,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 30),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Type de cart",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    icon: Icon(Icons.close),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  120, // Hauteur définie pour le ListView horizontal
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: ScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: list_TypeCart.length,
                                                itemBuilder: (context, index) {
                                                  final cart =
                                                      list_TypeCart[index];
                                                  final isSelected =
                                                      selectedCart == cart;
                                                  return TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        selectedCart = cart;
                                                        _changeMapType(cart.id);
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                    child: afficheTypeDeCart(
                                                        cart.image,
                                                        cart.nom,
                                                        isSelected),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCurrentLocation
            ? _navigateToCurrentLocation
            : () {
                // Position position = await Geolocator.getCurrentPosition(
                //   desiredAccuracy: LocationAccuracy.high,
                // );
                getLocationPermission();
              },
        child: Icon(
          Icons.my_location,
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  String _getMapUrlTemplate() {
    switch (_mapType) {
      case 'satellite':
        return 'https://api.maptiler.com/maps/hybrid/{z}/{x}/{y}.jpg?key={key}';
      case 'streets':
      default:
        return 'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key={key}';
    }
  }

  Widget afficheTypeDeCart(String img, String nom, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(color: kPrimaryColor, width: 3)
                  : Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(img),
              ),
            ),
          ),
          Text(
            nom,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class TypeCart {
  String id;
  String nom;
  String image;
  TypeCart({required this.nom, required this.image, required this.id});
}
