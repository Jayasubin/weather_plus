part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetAvailable extends InternetState {
  final ConnectivityResult result;

  InternetAvailable(this.result);
}

class InternetUnavailable extends InternetState {}
