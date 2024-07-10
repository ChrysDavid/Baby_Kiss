class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimezone timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final timezone = LocationTimezone(
          description: json['timezone']['description'],
          offset: json['timezone']['offset']);
      final street = LocationStreet(
          name: json['street']['name'],
          number: json['street']['number']);
      final coordinates = LocationCoordinates(
          lattitude: json['coordinates']['latitude'],
          longitude: json['coordinates']['longitude']);
     return UserLocation(
          city: json['city'],
          state: json['state'],
          country: json['country'],
          postcode: json['postcode'].toString(),
          street: street,
          coordinates: coordinates,
          timezone: timezone);
  }
}

class LocationCoordinates {
  final String lattitude;
  final String longitude;
  LocationCoordinates({required this.lattitude, required this.longitude});
}

class LocationTimezone {
  final String offset;
  final String description;
  LocationTimezone({
    required this.description,
    required this.offset,
  });
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({required this.name, required this.number});
}
