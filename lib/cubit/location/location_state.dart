part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationDisabled extends LocationState {}

class LocationPermissionDenied extends LocationState {}

class LocationPermissionDeniedForever extends LocationState {}

class LocationFetching extends LocationState {}

class LocationError extends LocationState {}

class LocationFetched extends LocationState {
  final LocationData locationData;

  LocationFetched(this.locationData);
}
