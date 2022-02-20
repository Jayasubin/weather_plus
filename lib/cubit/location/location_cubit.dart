import 'package:bloc/bloc.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:weather_plus/model/service/location.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> getLocation() async {
    emit(LocationInitial());

    Location _location = LocationService().locationInstance;

    bool _serviceEnabled = await _location.serviceEnabled();

    if (_serviceEnabled) {
      PermissionStatus _permissionStatus = await _location.hasPermission();

      if (_permissionStatus == PermissionStatus.granted) {
        LocationData _locationData = await _location.getLocation();

        Future.delayed(const Duration(milliseconds: 800), () {
          emit(LocationFetched(_locationData));
        });
      } else {
        emit(LocationPermissionDenied());

        await _location.requestPermission();
        getLocation();
      }
    } else {
      emit(LocationDisabled());

      await _location.requestService();
      getLocation();
    }
  }
}
