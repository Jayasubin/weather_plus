part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetAvailable extends InternetState {}

class InternetUnavailable extends InternetState {}
