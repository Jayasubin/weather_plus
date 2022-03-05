import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:weather_plus/model/service/location.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> getLocation() async {
    LocationData? _data;
    DateTime? _updateTime;

    emit(LocationInitial());

    Location _location = LocationService().locationInstance;

    bool _serviceEnabled = await _location.serviceEnabled();

    if (_updateTime == null ||
        _updateTime.difference(DateTime.now()).inMinutes >= 5) {
      if (_serviceEnabled) {
        PermissionStatus _permissionStatus = await _location.hasPermission();

        if (_permissionStatus == PermissionStatus.granted) {
          try {
            _data = await _location.getLocation();
            _updateTime = DateTime.now();

            emit(LocationFetched(_data));
          } catch (e) {
            emit(LocationError());

            rethrow;
          }
        } else {
          if (_permissionStatus == PermissionStatus.deniedForever) {
            emit(LocationPermissionDeniedForever());
          }
          emit(LocationPermissionDenied());

          await _location.requestPermission();
          getLocation();
        }
      } else {
        emit(LocationDisabled());

        await _location.requestService();
        getLocation();
      }
    } else {
      log('Previous Location valid');
      emit(LocationFetched(_data!));
    }
  }
}
