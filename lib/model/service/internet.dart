import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService {
  static final InternetService _internetSingleton = InternetService._internal();

  factory InternetService() {
    return _internetSingleton;
  }

  InternetService._internal();

  final Connectivity _connectivityInstance = Connectivity();

  Connectivity get connectivity => _connectivityInstance;

  Future<ConnectivityResult> getConnectivity() async {
    ConnectivityResult connectivity = await Connectivity().checkConnectivity();
    return connectivity;
  }
}
