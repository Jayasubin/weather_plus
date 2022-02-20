import 'package:location/location.dart';

class LocationService {
  static final LocationService _locationSingleton = LocationService._internal();

  factory LocationService() {
    return _locationSingleton;
  }

  LocationService._internal();

  final Location _location = Location();

  Location get locationInstance => _location;
}
