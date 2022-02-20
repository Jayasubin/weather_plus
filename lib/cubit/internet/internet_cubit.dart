import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:weather_plus/model/service/internet.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInitial());

  Future<void> checkConnectivity() async {
    final ConnectivityResult connectivity =
        await InternetService().getConnectivity();

    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        if (connectivity == ConnectivityResult.none) {
          emit(InternetUnavailable());
        } else {
          emit(InternetAvailable(connectivity));
        }
      },
    );

    InternetService().connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        emit(InternetInitial());
        Future.delayed(
          const Duration(milliseconds: 800),
          () {
            if (result == ConnectivityResult.none) {
              emit(InternetUnavailable());
            } else {
              emit(InternetAvailable(result));
            }
          },
        );
      },
    );
  }
}
