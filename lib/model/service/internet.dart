import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService {
  Future<ConnectivityResult> getConnectivity() async {
    ConnectivityResult connectivity = await Connectivity().checkConnectivity();
    return connectivity;
  }
}
