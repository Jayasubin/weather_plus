part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationDisabled extends LocationState {}

class LocationPermissionMissing extends LocationState {}

class LocationFetching extends LocationState {}

class LocationFetched extends LocationState {
  final LocationData locationData;

  LocationFetched(this.locationData);
}

class LocationExpired extends LocationState {}
